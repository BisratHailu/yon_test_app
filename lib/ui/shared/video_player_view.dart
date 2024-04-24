import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yon_test/core/enums/view_states.dart';
import 'package:yon_test/core/models/episode.dart';
import 'package:yon_test/core/view_models/video_player_model.dart';
import 'package:yon_test/ui/shared/base_view.dart';
import 'package:yon_test/ui/shared/utils/color.dart';

import '../../core/models/movie.dart';

class VideoPlayerView extends StatelessWidget {
  static const kVideoPlayerView = 'video_player_view';
  final Movie movie;
  final int index;

  const VideoPlayerView({super.key, required this.movie, required this.index});

  @override
  Widget build(BuildContext context) {
    return BaseView<VideoPlayerModel>(
      onModelReady: (model) {
        model.initializer('assets/videos/vid.mp4');
        model.getCurrentDuration();
      },
      builder: (context, videoPlayerModel, _) => Scaffold(
        backgroundColor: YonTestColor.primaryColor,
        body: Center(
          child: videoPlayerModel.getState<InitVideoPlayerViewState>() ==
                  InitVideoPlayerViewState.Busy
              ? Container(
                  color: YonTestColor.primaryColor,
                  child: const CircularProgressIndicator(
                    backgroundColor: YonTestColor.secondaryColor,
                  ),
                )
              : Stack(
                  children: [
                    _buildVideoPlayer(videoPlayerModel),
                    _buildButtons(videoPlayerModel),
                    _buildInfoSection(),
                    _buildProgressIndicator(videoPlayerModel),
                    _buildStartEndMin(videoPlayerModel),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildButtons(VideoPlayerModel videoPlayerModel) =>
      !videoPlayerModel.controller.value.isPlaying
          ? Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => videoPlayerModel.play(),
                child: const Icon(
                  Icons.play_arrow,
                  color: YonTestColor.secondaryColor,
                  size: 100,
                ),
              ),
            )
          : GestureDetector(
              onTap: () => videoPlayerModel.pause(),
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.transparent,
              ),
            );

  Widget _buildVideoPlayer(VideoPlayerModel videoPlayerModel) => Align(
        alignment: Alignment.center,
        child: AspectRatio(
          aspectRatio: videoPlayerModel.controller.value.aspectRatio,
          child: VideoPlayer(
            videoPlayerModel.controller,
          ),
        ),
      );

  Widget _buildProgressIndicator(VideoPlayerModel videoPlayerModel) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 25),
          child: VideoProgressIndicator(
            videoPlayerModel.controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
                backgroundColor: YonTestColor.secondaryColor.withOpacity(0.25),
                playedColor: YonTestColor.secondaryColor),
          ),
        ),
      );

  Widget _buildInfoSection() => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 45,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(),
              _buildDescription(),
            ],
          ),
        ),
      );

  Widget _buildTitle() => Text(
        movie.title ?? '',
        maxLines: 1,
        style: const TextStyle(
            color: YonTestColor.secondaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w700),
      );

  Widget _buildDescription() => Text(
        movie.episodes?[index].title ?? '',
        style: TextStyle(
            color: YonTestColor.secondaryColor.withOpacity(0.75),
            fontSize: 14,
            fontWeight: FontWeight.w300),
      );

  Widget _buildStartEndMin(VideoPlayerModel videoPlayerModel) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                videoPlayerModel.getCurrentDuration(),
                style: const TextStyle(
                    color: YonTestColor.secondaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w200),
              ),
              Text(
                videoPlayerModel.getTotalDuration(),
                style: const TextStyle(
                    color: YonTestColor.secondaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w200),
              )
            ],
          ),
        ),
      );
}
