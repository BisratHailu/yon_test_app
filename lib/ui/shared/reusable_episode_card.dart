import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yon_test/core/models/episode.dart';
import 'package:yon_test/ui/shared/reusable_episode_thumbnail.dart';
import 'package:yon_test/ui/shared/reusable_movie_card.dart';
import 'package:yon_test/ui/shared/utils/color.dart';

class ReusableEpisodeCard extends StatelessWidget {
  final Episode episode;
  final bool isLocked;
  const ReusableEpisodeCard({super.key,required this.episode,required this.isLocked});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      child: Row(
        children: [
          ReusableEpisodeThumbnail(episode: episode),
          const SizedBox(width: 15),
          _buildSection()
        ],
      ),
    );
  }



  Widget _buildSection() => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTitle(),
       const SizedBox(height: 15),
        _buildDescription(),
      ],
    ),
  );

  Widget _buildTitle() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          episode.title ?? '',
          maxLines: 1,
          style:  const TextStyle(
              color: YonTestColor.secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ),

      const Icon(Icons.lock_outline_rounded,color: YonTestColor.secondaryColor,),
    ],
  );

      Widget _buildDescription() => Text(
    episode.description ?? '',
    style:  TextStyle(
        color: YonTestColor.secondaryColor.withOpacity(0.75),
        fontSize: 14,
        fontWeight: FontWeight.w300),
  );
}
