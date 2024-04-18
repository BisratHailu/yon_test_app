import 'package:flutter/material.dart';

import 'utils/color.dart';



class ReusableHeaderTitle extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;

  const ReusableHeaderTitle({super.key, required this.title,this.onTap});

  @override
  Widget build(BuildContext context) {
    return       SizedBox(
      height: 50,
      width: double.infinity,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const  TextStyle(
              color: YonTestColor.secondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
    );

  }
}
