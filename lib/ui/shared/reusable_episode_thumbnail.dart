import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yon_test/core/models/episode.dart';
import 'package:yon_test/core/models/movie.dart';
import 'package:yon_test/ui/shared/utils/color.dart';
import 'package:yon_test/ui/views/watch_movie_view.dart';

class ReusableEpisodeThumbnail extends StatelessWidget {
  final Episode episode;

  const ReusableEpisodeThumbnail(
      {super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: double.maxFinite,
        width: 125,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
        child: Stack(
          children: [
            _buildImage(),
            _buildLowerBlurEffect(),
            _buildPlayButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() => Align(
    alignment: Alignment.center,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        episode.image ?? '',
        width: 125,
        height: double.maxFinite,
        fit: BoxFit.cover,
      ),
    ),
  );

  Widget _buildLowerBlurEffect() => Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.01),
            // Colors.black.withOpacity(0.05),
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.75),
            Colors.black.withOpacity(0.9),
          ],
        ),
      ),
    ),
  );

  Widget _buildPlayButton() =>  Align(
    alignment: Alignment.center,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(episode.image ?? ''),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: const Icon(
            Icons.play_arrow_rounded,
            color: YonTestColor.secondaryColor,
            size: 50,
          ),
        ),
      ),
    ),
  );




}
