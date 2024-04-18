import 'package:yon_test/core/models/movie.dart';
import 'package:yon_test/core/services/base_api/yon_test_api.dart';

class YonTestApiFake extends YonTestApi {
  List<Movie> carouselMovies = [
    Movie(image: 'assets/images/poster_2.jpg', subTitle: 'S2:E5'),
    Movie(image: 'assets/images/poster_1.jpg', subTitle: 'S1:E2'),
    Movie(image: 'assets/images/poster_3.jpg', subTitle: 'S3:E1'),
    Movie(image: 'assets/images/poster_2.jpg', subTitle: 'S2:E5'),
    Movie(image: 'assets/images/poster_1.jpg', subTitle: 'S1:E2'),
    Movie(image: 'assets/images/poster_3.jpg', subTitle: 'S3:E1')
  ];
  List<Movie> recentMovies = [
    Movie(image: 'assets/images/poster_1.jpg', subTitle: 'S1:E2'),
    Movie(image: 'assets/images/poster_2.jpg', subTitle: 'S2:E5'),
    Movie(image: 'assets/images/poster_3.jpg', subTitle: 'S3:E1'),
    Movie(image: 'assets/images/poster_2.jpg', subTitle: 'S2:E5'),
    Movie(image: 'assets/images/poster_1.jpg', subTitle: 'S1:E2'),
    Movie(image: 'assets/images/poster_3.jpg', subTitle: 'S3:E1')
  ];
  List<Movie> onGoingMovies = [
    Movie(image: 'assets/images/poster_4.jpg', subTitle: 'S3:E1'),
    Movie(image: 'assets/images/poster_5.jpg', subTitle: 'S1:E2'),
    Movie(image: 'assets/images/poster_2.jpg', subTitle: 'S2:E5'),
    Movie(image: 'assets/images/poster_6.jpg', subTitle: 'S2:E5'),
    Movie(image: 'assets/images/poster_1.jpg', subTitle: 'S1:E2'),
    Movie(image: 'assets/images/poster_3.jpg', subTitle: 'S3:E1')
  ];
  List<Movie> mostWatchedMovies = [
    Movie(image: 'assets/images/poster_6.jpg', subTitle: 'S1:E2'),
    Movie(image: 'assets/images/poster_7.jpg', subTitle: 'S2:E5'),
    Movie(image: 'assets/images/poster_1.jpg', subTitle: 'S3:E1'),
    Movie(image: 'assets/images/poster_2.jpg', subTitle: 'S2:E5'),
    Movie(image: 'assets/images/poster_4.jpg', subTitle: 'S2:E5'),
    Movie(image: 'assets/images/poster_3.jpg', subTitle: 'S1:E2'),
    Movie(image: 'assets/images/poster_5.jpg', subTitle: 'S3:E1')
  ];

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
