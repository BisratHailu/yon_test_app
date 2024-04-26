import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:yon_test/core/enums/view_states.dart';
import 'package:yon_test/core/models/episode.dart';
import 'package:yon_test/core/view_models/video_player_model.dart';
import 'package:yon_test/ui/shared/base_view.dart';
import 'package:yon_test/ui/shared/router/video_player_router.dart';
import 'package:yon_test/ui/shared/utils/color.dart';
import 'package:yon_test/ui/widgets/reusable_back_button.dart';
import 'package:yon_test/ui/widgets/reusable_menu_button.dart';

import '../../core/models/movie.dart';
import '../widgets/reusable_blur_back_button.dart';

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
        body:_buildStack(videoPlayerModel),
      ),
    );
  }


  Widget _buildStack(VideoPlayerModel videoPlayerModel)=> Stack(
    children: [
      _buildBody(videoPlayerModel),
      _buildTopButtons()
    ],
  );

  Widget _buildTopButtons() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _buildBackButton(),
      _buildMenuButton()
    ],
  );

      Widget _buildMenuButton() => const SafeArea(
    child: Padding(
      padding: EdgeInsets.only(top: 7, right: 10),
      child: ReusableMenuButton(),
    ),
  );

  Widget _buildBody(VideoPlayerModel videoPlayerModel) =>   Center(
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
        _buildLowerSection(videoPlayerModel)
      ],
    ),
  );




  Widget _buildBackButton() => const SafeArea(
    child: Padding(
      padding: EdgeInsets.only(top: 7, left: 10),
      child: ReusableBackButton(),
    ),
  );

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

  Widget _buildLowerSection(VideoPlayerModel videoPlayerModel) => Align(
        alignment: Alignment.bottomLeft,
        child:videoPlayerModel.isIndicatorVisible ? Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildInfoSection(),
              const SizedBox(height: 7),
              _buildProgressIndicator(videoPlayerModel),
              const SizedBox(height: 5),
              _buildStartEndMin(videoPlayerModel),
            ],
          ),
        ):Container(),
      );

  Widget _buildProgressIndicator(VideoPlayerModel videoPlayerModel) =>
      Container(
        height: 20,
        width: double.maxFinite,
        margin: const EdgeInsets.only(right: 5, left: 2),
        child: SliderTheme(
          data: SliderThemeData(
            trackHeight: 4,
            overlayShape: SliderComponentShape.noOverlay,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7.0),
          ),
          child: Slider(
            value: videoPlayerModel.value,
            thumbColor: YonTestColor.secondaryColor,
            activeColor: YonTestColor.secondaryColor,
            inactiveColor: YonTestColor.secondaryColor.withOpacity(0.5),
            onChanged: (newValue) => videoPlayerModel.onDrag(newValue),
          ),
        ),
      );

  Widget _buildInfoSection() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(),
            _buildDescription(),
          ],
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

  Widget _buildStartEndMin(VideoPlayerModel videoPlayerModel) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              videoPlayerModel.getCurrentDuration(),
              style:  TextStyle(
                  color: YonTestColor.secondaryColor.withOpacity(0.75),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              videoPlayerModel.getTotalDuration(),
              style:  TextStyle(
                  color: YonTestColor.secondaryColor.withOpacity(0.75),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      );
}
