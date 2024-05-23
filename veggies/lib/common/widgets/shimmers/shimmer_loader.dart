import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';

import '../../../utils/constants/color.dart';

class VShimmerEffect extends StatelessWidget {
  const VShimmerEffect(
      {super.key,
      required this.width,
      required this.height,
       this.radius = 15,
      this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark?Colors.green.shade300: Colors.green.shade300,
        highlightColor: dark?Colors.green.shade300: Colors.green.shade300,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: color ?? (dark ? VColors.darkergrey:VColors.light),
          ),
        ),
    );
  }
}
