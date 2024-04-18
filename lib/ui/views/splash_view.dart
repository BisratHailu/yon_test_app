import 'package:flutter/material.dart';
import '../shared/utils/color.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YonTestColor.primaryColor,
      body: Container(),
    );
  }

  Widget _buildLogo() => Center(
        child: SizedBox(
          height: 300,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      );




}
