import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:veggies/common/widgets/icons/v_circular_icon.dart';
import 'package:veggies/common/widgets/images/v_rounded_images.dart';
import 'package:veggies/common/widgets/texts/product_price_text.dart';
import 'package:veggies/common/widgets/texts/product_title_text.dart';
import 'package:veggies/common/widgets/texts/v_brand_title_text.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';

class VProductCardHorizontal extends StatelessWidget {
  const VProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Container(
      height: 120,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [VShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(VSizes.productItemRadius),
        color: dark ? VColors.secondary : VColors.primary,
      ),
      child: Row(
        children: [
          //Thumbnail
          VRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(VSizes.sm),
            backgroundColor: dark ? VColors.dark : VColors.light,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: VRoundedImage(
                    imageUrl: VImages.cashew,
                    backgroundColor: dark ? VColors.dark : VColors.light,
                    applyImageRadius: true,
                  ),
                ),

                //sale tag
                Positioned(
                  top: 12,
                  child: VRoundedContainer(
                    radius: VSizes.sm,
                    backgroundColor: dark ? VColors.secondary : VColors.primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: VSizes.sm, vertical: VSizes.xs),
                    child: Text(
                      '20%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: VColors.dark),
                    ),
                  ),
                ),
                //favourite icon
                const Positioned(
                  top: 0,
                  right: 0,
                  child: VCircularIcon(
                    icon: Iconsax.heart,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: VSizes.spaceBtwItems / 4,
          ),
          //details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: VSizes.sm,right: VSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VProductTitleText(
                        title: 'Fresh Potatoes directly from field',
                        smallSize: true,
                      ),
                      SizedBox(
                        height: VSizes.spaceBtwItems / 2,
                      ),
                      VBrandTitleWithVerifiedIcon(
                        title: 'Meri Sabji',
                        iconColor: VColors.light,
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const VProductPriceText(price: '20/kg'),
                      //add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: VColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(VSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(VSizes.productItemRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: VSizes.iconLg * 1.2,
                          height: VSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add_copy,
                              color: VColors.light,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
