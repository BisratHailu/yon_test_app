import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yon_test/core/services/fake_api/yon_test_api_fake.dart';

import '../enums/view_states.dart';
import '../models/movie.dart';
import '../services/locator.dart';
import 'base_model.dart';


class YonTestModel extends BaseModel {

  YonTestApiFake yonTestApiFake = locator<YonTestApiFake>();

  List<Movie> _carouselMovies = [];
  List<Movie> get carouselMovies => _carouselMovies;

  List<Movie> _recentMovies = [];
  List<Movie> get recentMovies => _recentMovies;

  List<Movie> _onGoingMovies = [];
  List<Movie> get onGoingMovies => _onGoingMovies;

  List<Movie> _mostWatchedMovies = [];
  List<Movie> get mostWatchedMovies => _mostWatchedMovies;

  bool canDispose = false;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

// Carousel movies
  Future<void> initCarouselMovies() async {
    initState<CarouselMoviesViewState>(CarouselMoviesViewState.Busy);
      _carouselMovies = await yonTestApiFake.getCarouselMovies();

    setState<CarouselMoviesViewState>(CarouselMoviesViewState.Idle);
  }

  Future<void> loadCarouselMovies() async {
    setState<CarouselMoviesViewState>(CarouselMoviesViewState.Busy);
    _carouselMovies = await yonTestApiFake.getCarouselMovies();

    setState<CarouselMoviesViewState>(CarouselMoviesViewState.Idle);
  }

  // Recent movies
  Future<void> initRecentMovies() async {
    initState<RecentMoviesViewState>(RecentMoviesViewState.Busy);
    _recentMovies = await yonTestApiFake.getRecentMovies();

    setState<RecentMoviesViewState>(RecentMoviesViewState.Idle);
  }

  Future<void> loadRecentMovies() async {
    setState<RecentMoviesViewState>(RecentMoviesViewState.Busy);
    _recentMovies = await yonTestApiFake.getRecentMovies();

    setState<RecentMoviesViewState>(RecentMoviesViewState.Idle);
  }
  // Ongoing Movies
  Future<void> initOngoingMovies() async {
    initState<OngoingMoviesViewState>(OngoingMoviesViewState.Busy);
    _onGoingMovies = await yonTestApiFake.getOnGoingMovies();

    setState<OngoingMoviesViewState>(OngoingMoviesViewState.Idle);
  }

  Future<void> loadOngoingMovies() async {
    setState<OngoingMoviesViewState>(OngoingMoviesViewState.Busy);
    _onGoingMovies = await yonTestApiFake.getOnGoingMovies();

    setState<OngoingMoviesViewState>(OngoingMoviesViewState.Idle);
  }
  // Most watched movies
  Future<void> initMostWatchedMovies() async {
    initState<MostWatchedMoviesViewState>(MostWatchedMoviesViewState.Busy);
    _mostWatchedMovies = await yonTestApiFake.getMostWatchedMovies();

    setState<MostWatchedMoviesViewState>(MostWatchedMoviesViewState.Idle);
  }

  Future<void> loadMostWatchedMovies() async {
    setState<MostWatchedMoviesViewState>(MostWatchedMoviesViewState.Busy);
    _mostWatchedMovies = await yonTestApiFake.getMostWatchedMovies();

    setState<MostWatchedMoviesViewState>(MostWatchedMoviesViewState.Idle);
  }

  set setCurrentIndex (int index) {
    _currentIndex = index;
    notifyListeners();
  }
  @override
  void dispose() {
    if (canDispose) {
      // Call super only if canDispose is true
      super.dispose();
    }
  }
}
