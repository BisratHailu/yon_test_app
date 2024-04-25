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

  bool _isIndicatorVisible = true;

  bool get isIndicatorVisible => _isIndicatorVisible;

  double _value = 0.0;

  double get value => _value;

  String _currentDuration = '0:00'; // Variable to hold current time
  String _totalDuration = '0:00'; // Variable to hold current time

  VideoPlayerController get controller => _controller;

  void initializer(String video) async {
    initState<InitVideoPlayerViewState>(InitVideoPlayerViewState.Busy);
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          "https://kurazmediav1-frct1.streaming.media.azure.net/0ebafa80-e75d-45fd-bfe3-486cb21030e3/01.Overview_1280x720_AACAudio_612.mp4"),
    );
    await _controller.initialize();
    await _controller.play();

    setState<InitVideoPlayerViewState>(InitVideoPlayerViewState.Idle);
  }

  void onDrag(double newValue) {
    _value = newValue;
    final Duration duration = _controller.value.duration;
    _controller.seekTo(
        Duration(milliseconds: (duration.inMilliseconds * newValue).round()));
  }

  String getCurrentDuration() {
    _controller.position.asStream().listen((Duration? duration) {
      _value =
          duration!.inMilliseconds / _controller.value.duration.inMilliseconds;
      _currentDuration =
          '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
      notifyListeners();
    });
    return _currentDuration;
  }

  String getTotalDuration() {
    _controller.position.asStream().listen((Duration? duration) {
      _totalDuration =
          '${_controller.value.duration.inMinutes}:${(_controller.value.duration.inSeconds % 60).toString().padLeft(2, '0')}';
    });
    return _totalDuration;
  }

  void play() async {
    await _controller.play();
    notifyListeners();
    hideProgressIndicator();
  }

  void pause() async {
    await _controller.pause();
    notifyListeners();
    hideProgressIndicator();
  }

  void hideProgressIndicator() async {
    _isIndicatorVisible = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 5), () {
      _isIndicatorVisible = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
