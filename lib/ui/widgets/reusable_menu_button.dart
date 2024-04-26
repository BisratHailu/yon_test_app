import 'dart:ui';

import 'package:flutter/material.dart';

import '../shared/utils/color.dart';

class ReusableMenuButton extends StatelessWidget {
  const ReusableMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pop(context),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: YonTestColor.secondaryColor.withOpacity(0.15),
        child: const Icon(
          Icons.more_vert_outlined,
          color: YonTestColor.secondaryColor,
          size: 15,
        ),
      ),
    );
  }
}
