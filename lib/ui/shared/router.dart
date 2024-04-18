import 'package:flutter/material.dart';

import '../views/landing_view.dart';

class YonTestRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

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
