import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yon_test/ui/shared/router.dart';
import 'package:yon_test/ui/shared/utils/theme.dart';
import 'package:yon_test/ui/views/landing_view.dart';
import 'package:yon_test/ui/views/splash_view.dart';

import 'core/services/locator.dart';

void main() {
  setupLocator();
  locator<YonTestTheme>().setTheme();
  runApp(const VCard());
}

class VCard extends StatelessWidget {
  const VCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: YonTestRouter.generateRoute,
      theme: ThemeData().copyWith(textTheme: GoogleFonts.poppinsTextTheme()),
      home: const LandingView(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}


