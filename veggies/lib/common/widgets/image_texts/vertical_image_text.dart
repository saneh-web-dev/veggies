import 'package:flutter/material.dart';
import 'package:veggies/common/widgets/images/v_circular_image.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class VVerticalImageText extends StatelessWidget {
  const VVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = VColors.light,
    this.backgroundColor = VColors.light,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: VSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(VSizes.sm),
              decoration: BoxDecoration(
                  color:
                      backgroundColor ?? (dark ? VColors.dark : VColors.light),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: dark ? VColors.light : VColors.dark,
                ),
              ),
            ),
            // Texts
            const SizedBox(
              height: VSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                'Red Chilli',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: VColors.light),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
            VCircularImage(
                image: image,
            fit: BoxFit.fitWidth,
              padding: VSizes.sm * 14,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark?VColors.light:VColors.dark,
            )
          ],
        ),
      ),
    );
  }
}
