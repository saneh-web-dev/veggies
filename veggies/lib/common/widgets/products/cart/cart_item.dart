import 'package:flutter/material.dart';
import 'package:veggies/utils/constants/enums.dart';

import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/v_rounded_images.dart';
import '../../texts/brand_title_text.dart';
import '../../texts/v_brand_title_text.dart';

class VCartItem extends StatelessWidget {
  const VCartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        //image
        VRoundedImage(
          imageUrl: VImages.grapes,
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(VSizes.sm),
          backgroundColor:
          dark ? VColors.secondary : VColors.primary,
        ),

        const SizedBox(
          width: VSizes.spaceBtwItems,
        ),

        //title,price,size
         const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VBrandTitleWithVerifiedIcon(title: 'Meri Sabji',
              brandTextSizes: TextSizes.small,
            ),
            VBrandTitleText(
              title: 'Tomato',
              maxLines: 1,
              brandTextSizes: TextSizes.large,
            ),
            VBrandTitleText(title: 'Juicy red tomato with full of vitamin C')
            //Attributes
          ],
        )
      ],
    );
  }
}
