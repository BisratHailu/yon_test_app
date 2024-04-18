import 'package:flutter/material.dart';

import '../shared/utils/color.dart';

class ReusableRaisedButton extends StatelessWidget {
  final String? label;
  final GestureTapCallback? onTap;
  final bool hasIcon;
  final IconData icon;
  final double fontSize;
  final double iconSize;
  final double borderRadius;
  final Color backgroundColor;
  final Color foregroundColor;
  final BorderSide borderSide;

  const ReusableRaisedButton(
      {super.key,
       this.label,
      this.onTap,
      this.hasIcon = false,
      this.fontSize = 12,
        this.iconSize = 14,
        this.borderRadius = 10,
      this.icon = Icons.shopping_cart_outlined,
      this.backgroundColor = YonTestColor.secondaryColor,
      this.foregroundColor = YonTestColor.primaryColor,
        this.borderSide = BorderSide.none});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        onPressed: onTap,

        style: ButtonStyle(

          backgroundColor: MaterialStateProperty.all(backgroundColor),
          foregroundColor: MaterialStateProperty.all(foregroundColor),
          textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500)),
          shape: MaterialStateProperty.all(
             RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
          ),
          side: MaterialStateProperty.all(borderSide)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasIcon
                ? Icon(
                    icon,
                    size: iconSize,
                  )
                : Container(),
          label == null? Container():  hasIcon
                ? const SizedBox(
                    width: 15,
                  )
                : const SizedBox(
                    height: 0,
                    width: 0,
                  ),
           label != null?  Text(
              label!,
            ): Container(),
          ],
        ),
      ),
    );
  }
}
