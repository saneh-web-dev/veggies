import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:veggies/common/widgets/images/v_rounded_images.dart';
import 'package:veggies/common/widgets/texts/product_title_text.dart';
import 'package:veggies/features/shop/controllers/product_controller.dart';
import 'package:veggies/features/shop/screens/product_details/product_detail.dart';
import 'package:veggies/utils/constants/sizes.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/enums.dart';
import '../../../styles/shadows.dart';
import '../../icons/v_circular_icon.dart';
import '../../texts/product_price_text.dart';

class VProductCartVertical extends StatelessWidget {
  const VProductCartVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail(
            product: product,
          )),
      child: Container(
        height: 10,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          boxShadow: [VShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(VSizes.productItemRadius),
          color: dark ? VColors.secondary : VColors.light,
        ),
        child: Column(
          children: [
            // thumbnail,wishlist
            SizedBox(
              height: 150, // Set the height here
              width: 150,
              child: VRoundedContainer(
                padding: const EdgeInsets.all(VSizes.sm / 2),
                backgroundColor: dark ? VColors.primary : VColors.primary,
                child: Stack(
                  children: [
                    //thumbnail image
                    Center(
                      child: VRoundedImage(
                        padding: const EdgeInsets.all(VSizes.md),
                        imageUrl: product.thumbnail,
                        applyImageRadius: true,
                        isNetworkImage: true,
                      ),
                    ),

                    //sale tag
                    Positioned(
                      top: 12,
                      left: 4,
                      child: VRoundedContainer(
                        radius: VSizes.sm,
                        backgroundColor: VColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: VSizes.sm, vertical: VSizes.xs),
                        child: Text(
                          "$salePercentage",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: VColors.light),
                        ),
                      ),
                    ),

                    // favorite icon button
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: VCircularIcon(
                        icon: Iconsax.heart,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: VSizes.spaceBtwItems / 2,
            ),

            //details
            Padding(
              padding: const EdgeInsets.only(left: VSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: VSizes.spaceBtwItems / 2,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.all(VSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: VSizes.sm),
                        child: VProductPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: VColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(VSizes.cardRadiusMd),
                      bottomRight: Radius.circular(VSizes.productItemRadius),
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
            ),
          ],
        ),
      ),
    );
  }
}
