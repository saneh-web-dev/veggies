import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/v_circular_image.dart';
import '../texts/v_brand_title_text.dart';

class VBrandCard extends StatelessWidget {
  const VBrandCard(
      {super.key,
        required this.showBorder,
        this.onTap,
         this.title,
      });

  final bool showBorder;
  final void Function()? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: VRoundedContainer(
        padding: const EdgeInsets.all(VSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //icon
            const Flexible(
              child: VCircularImage(
                image: VImages.vegetableIcon,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(
              width: VSizes.spaceBtwItems / 2,
            ),

            //Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                   const VBrandTitleWithVerifiedIcon(
                    title:'Vegetables',
                    brandTextSizes: TextSizes.large,
                  ),
                  Text(
                    '30 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
