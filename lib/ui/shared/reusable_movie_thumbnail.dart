import 'package:flutter/material.dart';
import 'package:yon_test/core/models/movie.dart';
import 'package:yon_test/ui/shared/reusable_raised_button.dart';
import 'package:yon_test/ui/shared/router/video_player_router.dart';
import 'package:yon_test/ui/shared/utils/color.dart';
import 'package:yon_test/ui/shared/video_player_view.dart';

class ReusableMovieThumbnail extends StatelessWidget {
  final Movie movie;

  const ReusableMovieThumbnail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildProductImage(movie.image ?? ''),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildBlurEffect(context),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildGenre(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildButton(context),
        ),
      ],
    );
  }

  Widget _buildProductImage(String image) => Image.asset(
        image,
        fit: BoxFit.cover,
        width: double.maxFinite,
        // height: 500,
      );

  Widget _buildGenre() => Padding(
    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 60),
    child: Text(
          movie.genre ?? '',
          style: TextStyle(
            color: YonTestColor.secondaryColor.withOpacity(0.75),
            fontSize: 16
          ),
        ),
  );

  Widget _buildButton(BuildContext context) =>  Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
        child: ReusableRaisedButton(
          hasIcon: true,
          icon: Icons.play_arrow_rounded,
          iconSize: 22,
          onTap:()=> Navigator.pushNamed(context, VideoPlayerView.kVideoPlayerView,arguments: VideoPlayerRouter(movie: movie, index: 0)),
          label: 'Watch now',
          fontSize: 16,
        ),
      );

  Widget _buildBlurEffect(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.01),
            // Colors.black.withOpacity(0.05),
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.25),
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.75),
            Colors.black.withOpacity(0.9),
          ],
        ),
      ),
    );
  }
}
