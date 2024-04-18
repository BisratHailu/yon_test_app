import 'package:flutter/material.dart';
import 'package:yon_test/core/view_models/yon_test_model.dart';
import 'package:yon_test/ui/shared/reusable_movie_card.dart';
import 'package:yon_test/ui/views/movie_carousel_view.dart';
import '../shared/base_view.dart';
import '../shared/reusable_header_title.dart';
import '../shared/utils/color.dart';

class LandingView extends StatelessWidget {
  static const kLandingView = 'landing_view';

  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<YonTestModel>(
      onModelReady: (model) async {
        await model.initCarouselMovies();
      },
      builder: (context, yonTestModel, _) => Scaffold(
        backgroundColor: YonTestColor.primaryColor,
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _buildSliverAppBar(yonTestModel, innerBoxIsScrolled)
            ];
          },
          body: _buildMovieSections(),
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(
          YonTestModel yonTestModel, bool innerBoxIsScrolled) =>
      SliverAppBar(
        expandedHeight: 600,
        pinned: true,
        floating: false,
        backgroundColor: YonTestColor.primaryColor,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          stretchModes: const [StretchMode.fadeTitle],
          background: _buildExpandedView(yonTestModel),
          title: innerBoxIsScrolled
              ? const Text(
                  'Test',
                  style: TextStyle(
                      color: YonTestColor.secondaryColor,
                      fontWeight: FontWeight.w700),
                )
              : Container(),
        ),
      );

  Widget _buildExpandedView(YonTestModel yonTestModel) =>
      MovieCarouselView(movie: yonTestModel.carouselMovies);

  Widget _buildMovieSections() => ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ReusableHeaderTitle(title: 'Recently added'),
          ),
          const SizedBox(
            height: 15,
          ),
          _buildRecentlyAddedMovies(),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ReusableHeaderTitle(title: 'Continue watching'),
          ),
          const SizedBox(
            height: 15,
          ),
          _buildOnGoingMovies(),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ReusableHeaderTitle(title: 'Most watched'),
          ),
          const SizedBox(
            height: 15,
          ),
          _buildMostWatchedMovies(),
          const SizedBox(
            height: 25,
          ),
        ],
      );

  Widget _buildRecentlyAddedMovies() => BaseView<YonTestModel>(
        onModelReady: (model) => model.initRecentMovies(),
        builder: (context, yonTestModel, _) => SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ReusableMovieCard(
                movie: yonTestModel.recentMovies[index],
                isPaused: false,
              ),
            ),
            itemCount: yonTestModel.recentMovies.length,
          ),
        ),
      );

  Widget _buildOnGoingMovies() => BaseView<YonTestModel>(
        onModelReady: (model) => model.initOngoingMovies(),
        builder: (context, yonTestModel, _) => SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ReusableMovieCard(
                movie: yonTestModel.onGoingMovies[index],
                isPaused: true,
              ),
            ),
            itemCount: yonTestModel.onGoingMovies.length,
          ),
        ),
      );

  Widget _buildMostWatchedMovies() => BaseView<YonTestModel>(
        onModelReady: (model) => model.initMostWatchedMovies(),
        builder: (context, yonTestModel, _) => SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ReusableMovieCard(
                movie: yonTestModel.mostWatchedMovies[index],
                isPaused: false,
              ),
            ),
            itemCount: yonTestModel.mostWatchedMovies.length,
          ),
        ),
      );
}
