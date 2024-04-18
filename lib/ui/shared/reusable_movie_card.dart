import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yon_test/core/models/movie.dart';
import 'package:yon_test/ui/shared/utils/color.dart';

class ReusableMovieCard extends StatelessWidget {
  final Movie movie;
  final bool isPaused;

  const ReusableMovieCard({super.key, required this.movie,required this.isPaused});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          _buildImage(),
          _buildLowerBlurEffect(),
          _buildPlayButton(),
          _buildProgressSection()
        ],
      ),
    );
  }

  Widget _buildImage() => Align(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            movie.image ?? '',
            width: 150,
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

  Widget _buildPlayButton() =>isPaused ? Align(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(movie.image ?? ''),
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
      ):Container();

  Widget _buildProgressSection() =>isPaused ? Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSubTitle(),
            const SizedBox(height: 5),
            _buildProgressIndicator(),

          ],
        ),
      ):Container();

  Widget _buildProgressIndicator() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: LinearProgressIndicator(
          color: YonTestColor.secondaryColor,
          value: 0.5,
          backgroundColor: YonTestColor.secondaryColor.withOpacity(0.5),
        ),
      );

  Widget _buildSubTitle() => Text(
        movie.subTitle ?? '',
        style: const TextStyle(
            fontWeight: FontWeight.w300, color: YonTestColor.secondaryColor),
      );
}
