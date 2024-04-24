import 'package:flutter/material.dart';
import 'package:yon_test/core/models/movie.dart';
import 'package:yon_test/ui/shared/router/video_player_router.dart';
import 'package:yon_test/ui/shared/video_player_view.dart';
import 'package:yon_test/ui/views/watch_movie_view.dart';

import '../../views/landing_view.dart';

class YonTestRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WatchMovieView.kWatchMovieView:
        return MaterialPageRoute(
          builder: (_) => WatchMovieView(movie: settings.arguments as Movie),
        );
      case VideoPlayerView.kVideoPlayerView:
        return MaterialPageRoute(
          builder: (_)  {
          VideoPlayerRouter router =
          settings.arguments as VideoPlayerRouter;
          return VideoPlayerView(
          movie: router.movie,
          index: router.index,
        );
    },
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
