import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:veggies/common/widgets/shimmers/shimmer_loader.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';

import '../../../utils/constants/color.dart';

// import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class VCircularImage extends StatelessWidget {
  const VCircularImage({
    super.key,
    this.fit = BoxFit.fitHeight, // Changed the default fit to cover
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = VSizes.sm,
  });

  final BoxFit fit; // Changed to non-nullable
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.only(top: 1,left: 1,right: 1,bottom: 1),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? VColors.dark : VColors.light),
        borderRadius: BorderRadius.circular(width / 2), // Updated to use half of width
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width / 2),
        // Updated to use half of width
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
            imageUrl: image,
            fit: fit,
            color: overlayColor,
            progressIndicatorBuilder: (context, url, downloadprogress) =>
            const VShimmerEffect(
              width: 55,
              height: 55,
              radius: 55,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
              : Image(
            fit: fit,
            image: AssetImage(image),
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}
