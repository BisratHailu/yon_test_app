import 'package:flutter/services.dart';

import 'color.dart';

class YonTestTheme{
  void setTheme(){
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: YonTestColor.primaryColor,
          statusBarColor: YonTestColor.primaryColor,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: true,
          systemStatusBarContrastEnforced: true,
        )

    );
  }
}