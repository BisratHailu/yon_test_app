import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yon_test/core/models/movie.dart';
import 'package:yon_test/core/view_models/yon_test_model.dart';
import 'package:yon_test/ui/shared/reusable_episode_card.dart';
import 'package:yon_test/ui/shared/reusable_movie_card.dart';
import 'package:yon_test/ui/shared/reusable_movie_thumbnail.dart';
import 'package:yon_test/ui/shared/utils/consts.dart';
import 'package:yon_test/ui/views/movie_carousel_view.dart';
import '../shared/base_view.dart';
import '../shared/reusable_header_title.dart';
import '../shared/utils/color.dart';
import '../widgets/reusable_blur_back_button.dart';

class WatchMovieView extends StatelessWidget {
  static const kWatchMovieView = 'watch_movie_view';
  final Movie movie;

  const WatchMovieView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BaseView<YonTestModel>(
      builder: (context, yonTestModel, _) => Scaffold(
        backgroundColor: YonTestColor.primaryColor,
        resizeToAvoidBottomInset: false,
        body: _buildBody(yonTestModel),
      ),
    );
  }

  Widget _buildBody(YonTestModel yonTestModel) => Stack(
        children: [_buildNestedScrollView(yonTestModel), _buildBackButton()],
      );

  Widget _buildNestedScrollView(YonTestModel yonTestModel) => NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[_buildSliverAppBar(yonTestModel, innerBoxIsScrolled)];
        },
        body: _buildEpisodesSection(),
      );

  SliverAppBar _buildSliverAppBar(
          YonTestModel yonTestModel, bool innerBoxIsScrolled) =>
      SliverAppBar(
        expandedHeight: 500,
        pinned: true,
        floating: false,
        backgroundColor: YonTestColor.primaryColor,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: const [StretchMode.fadeTitle],
          titlePadding: EdgeInsets.zero,
          background: _buildExpandedView(yonTestModel),
          title: innerBoxIsScrolled ? _buildTitle() : Container(),
        ),
      );

  Widget _buildBackButton() => SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 7, left: 10),
          child: ReusableBlurBackButton(image: movie.image ?? ''),
        ),
      );

  Widget _buildTitle() => Container(
        width: double.maxFinite,
        padding:
            const EdgeInsets.only(left: 65, top: 15, right: 10, bottom: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(movie.image ?? ''),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                YonTestColor.primaryColor.withOpacity(0.5), BlendMode.darken),
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Text(
            movie.title ?? 'Hello',
            style: const TextStyle(
                color: YonTestColor.secondaryColor,
                fontWeight: FontWeight.w700),
          ),
        ),
      );

  Widget _buildExpandedView(YonTestModel yonTestModel) =>
      ReusableMovieThumbnail(movie: movie);

  Widget _buildEpisodesSection() => ListView(
        children: [
          _buildMovieDescription(),
          const SizedBox(height: 25),
          _buildEpisodes()
        ],
      );

  Widget _buildMovieDescription() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          movie.description ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: YonTestColor.secondaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w200),
        ),
      );

  Widget _buildEpisodes() => ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: ReusableEpisodeCard(
            episode: movie.episodes![index],
            isLocked: index == 0 ? false : true,
          ),
        ),
        itemCount: movie.episodes?.length,
      );
}
