import 'package:flutter/material.dart';

import '../../../../utils/constants/color.dart';

class VCircularContainer extends StatelessWidget {
  const VCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = VColors.light,
    this.child,
    this.margin,
  });

  final double width;
  final double height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
