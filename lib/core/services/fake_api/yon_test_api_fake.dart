import 'package:yon_test/core/models/episode.dart';
import 'package:yon_test/core/models/movie.dart';
import 'package:yon_test/core/services/base_api/yon_test_api.dart';

class YonTestApiFake extends YonTestApi {
  List<Movie> carouselMovies = [
    Movie(
      title: 'Project Run Away',
      image: 'assets/images/poster_2.jpg',
      subTitle: 'S2:E5',
      description: description,
      genre: 'Crime, Action, Adventure & Comedy',
      episodes: episodes
    ),
    Movie(
      title: 'Project Run Away',

      image: 'assets/images/poster_1.jpg',
        subTitle: 'S1:E2',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes,),
    Movie(
      title: 'Project Run Away',

      image: 'assets/images/poster_3.jpg',
        subTitle: 'S3:E1',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',  episodes: episodes,),
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_2.jpg',
        subTitle: 'S2:E5',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes,),
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_1.jpg',
        subTitle: 'S1:E2',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes,),
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_3.jpg',
        subTitle: 'S3:E1',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',  episodes: episodes,)
  ];
  List<Movie> recentMovies = [
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_1.jpg',
        subTitle: 'S1:E2',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes,),
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_2.jpg',
        subTitle: 'S2:E5',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes,),
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_3.jpg',
        subTitle: 'S3:E1',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes,),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_2.jpg',
        subTitle: 'S2:E5',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_1.jpg',
        subTitle: 'S1:E2',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',    episodes: episodes),
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_3.jpg',
        subTitle: 'S3:E1',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes,),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_5.jpg',
        subTitle: 'S1:E2',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',  episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_2.jpg',
        subTitle: 'S2:E5',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_6.jpg',
        subTitle: 'S2:E5',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',    episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_1.jpg',
        subTitle: 'S1:E2',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',    episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_3.jpg',
        subTitle: 'S3:E1',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes)
  ];
  List<Movie> mostWatchedMovies = [
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_6.jpg',
        subTitle: 'S1:E2',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',    episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_7.jpg',
        subTitle: 'S2:E5',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy', episodes: episodes),
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_1.jpg',
        subTitle: 'S3:E1',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy', episodes: episodes,),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_2.jpg',
        subTitle: 'S2:E5',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',  episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_4.jpg',
        subTitle: 'S2:E5',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',  episodes: episodes),
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_3.jpg',
        subTitle: 'S1:E2',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',    episodes: episodes,),
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_5.jpg',
        subTitle: 'S3:E1',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes,)
  ];
  List<Movie> onGoingMovies = [
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_1.jpg',
      subTitle: 'S1:E2',
      description: description,
      genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes,),
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_2.jpg',
      subTitle: 'S2:E5',
      description: description,
      genre: 'Crime, Action, Adventure & Comedy',  episodes: episodes),
    Movie(
      title: 'Project Run Away',

      image: 'assets/images/poster_3.jpg',
      subTitle: 'S3:E1',
      description: description,
      genre: 'Crime, Action, Adventure & Comedy',  episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_2.jpg',
        subTitle: 'S2:E5',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_1.jpg',
        subTitle: 'S1:E2',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',    episodes: episodes),
    Movie(      title: 'Project Run Away',

      image: 'assets/images/poster_3.jpg',
      subTitle: 'S3:E1',
      description: description,
      genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes,),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_5.jpg',
        subTitle: 'S1:E2',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',  episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_2.jpg',
        subTitle: 'S2:E5',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_6.jpg',
        subTitle: 'S2:E5',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',    episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_1.jpg',
        subTitle: 'S1:E2',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',    episodes: episodes),
    Movie(      title: 'Project Run Away',

        image: 'assets/images/poster_3.jpg',
        subTitle: 'S3:E1',
        description: description,
        genre: 'Crime, Action, Adventure & Comedy',   episodes: episodes)
  ];


  static   List<Episode> episodes = [
    Episode(
        description: description,
        image: 'assets/images/poster_1.jpg',
        title: 'Season 1 Trailer: The Gentlemen'),
    Episode(
        description: description,
        image: 'assets/images/poster_2.jpg',
        title: '1. Refined Aggression'),
    Episode(
        description: description,
        image: 'assets/images/poster_3.jpg',
        title: '2. Tackle Tommy Woo Woo '),
    Episode(
        description: description,
        image: 'assets/images/poster_3.jpg',
        title: '3. Where is My weed at'),
    Episode(
        description: description,
        image: 'assets/images/poster_3.jpg',
        title: '2. Tackle Tommy Woo Woo '),
    Episode(
        description: description,
        image: 'assets/images/poster_3.jpg',
        title: '3. Where is My weed at'),
  ];
  static String description =
      "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It's also";

  @override
  Future<List<Movie>> getCarouselMovies() async {
    // TODO: implement getMovies
    return carouselMovies;
  }

  @override
  Future<List<Movie>> getRecentMovies() async {
    // TODO: implement getMovies
    return recentMovies;
  }

  @override
  Future<List<Movie>> getOnGoingMovies() async {
    // TODO: implement getMovies
    return onGoingMovies;
  }

  @override
  Future<List<Movie>> getMostWatchedMovies() async {
    // TODO: implement getMovies
    return mostWatchedMovies;
  }
}
