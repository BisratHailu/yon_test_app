

import '../../models/movie.dart';

abstract class YonTestApi {
   Future<List<Movie>> getCarouselMovies();
   Future<List<Movie>> getRecentMovies();
   Future<List<Movie>> getOnGoingMovies();
   Future<List<Movie>> getMostWatchedMovies();



}
