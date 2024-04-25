import 'dart:ui';

import 'package:flutter/material.dart';

import '../shared/utils/color.dart';

class ReusableBackButton extends StatelessWidget {
  const ReusableBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pop(context),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: YonTestColor.secondaryColor.withOpacity(0.15),
        child: const Padding(
          padding: EdgeInsets.only(left: 7),
          child: Icon(
            Icons.arrow_back_ios,
            color: YonTestColor.secondaryColor,
            size: 15,
          ),
        ),
      ),
    );
  }
}
