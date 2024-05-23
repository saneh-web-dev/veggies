import 'package:flutter/material.dart';

import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';

class VRoundedContainer extends StatelessWidget {
  const VRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = VSizes.cardRadiusLg,
      this.backgroundColor = VColors.light,
      this.child,
      this.margin,
      this.padding,
        this.showBorder = false,
      this.borderColor = VColors.primary,
      });

  final double? width;
  final double? height;
  final double radius;
  final Color backgroundColor;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool showBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
