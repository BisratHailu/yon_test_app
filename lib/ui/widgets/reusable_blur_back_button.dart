import 'dart:ui';

import 'package:flutter/material.dart';

import '../shared/utils/color.dart';

class ReusableBlurBackButton extends StatelessWidget {
  final String image;
  const ReusableBlurBackButton({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pop(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: CircleAvatar(
          radius: 15,
          backgroundImage: AssetImage(image,),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 500, sigmaY: 500),
            child: const Padding(
              padding: EdgeInsets.only(left: 7),
              child: Icon(
                Icons.arrow_back_ios,
                color: YonTestColor.secondaryColor,
                size: 15,
              ),
            ),
          ),
        ),
      
      ),
    );
  }
}
