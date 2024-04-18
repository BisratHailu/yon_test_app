import 'package:flutter/material.dart';

import '../shared/utils/color.dart';

class ReusableInactiveIndicator extends StatelessWidget {
  final Color color;

  const ReusableInactiveIndicator(
      {Key? key, this.color = YonTestColor.secondaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  }
}
