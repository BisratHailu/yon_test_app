import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:yon_test/core/services/fake_api/yon_test_api_fake.dart';

import '../enums/view_states.dart';
import '../models/movie.dart';
import '../services/locator.dart';
import 'base_model.dart';

class VideoPlayerModel extends BaseModel {
  late VideoPlayerController _controller;
  String _currentDuration = '0:00'; // Variable to hold current time
  String _totalDuration = '0:00'; // Variable to hold current time


  VideoPlayerController get controller => _controller;

  void initializer(String video) async {
    initState<InitVideoPlayerViewState>(InitVideoPlayerViewState.Busy);

    _controller = VideoPlayerController.asset(video);
    await _controller.initialize();
    await _controller.play();

    setState<InitVideoPlayerViewState>(InitVideoPlayerViewState.Idle);
  }

  String getCurrentDuration(){
    _controller.position.asStream().listen((Duration? duration) {
      _currentDuration =
      '${duration!.inMinutes}:${(duration!.inSeconds % 60).toString()}';
      notifyListeners();
    });
    return _currentDuration;
  }

  String getTotalDuration(){
    _controller.position.asStream().listen((Duration? duration) {
      _totalDuration =
      '${_controller.value.duration.inMinutes}:${(_controller.value.duration.inSeconds % 60).toString().padLeft(2, '0')}';

    });
    return _totalDuration;
  }


  void play() async{
    await _controller.play() ;
    notifyListeners();

  }

  void pause()async{
    await _controller.pause();
    notifyListeners();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
