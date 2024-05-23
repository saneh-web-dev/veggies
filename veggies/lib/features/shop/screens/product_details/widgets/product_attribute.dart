import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:veggies/common/widgets/texts/product_price_text.dart';
import 'package:veggies/common/widgets/texts/product_title_text.dart';
import 'package:veggies/common/widgets/texts/section_heading.dart';
import 'package:veggies/features/shop/controllers/product/variation_controller.dart';
import 'package:veggies/utils/constants/sizes.dart';

import '../../../../../utils/constants/color.dart';
import '../../../../../utils/helpers/helper_functions.dart';
// import '../../../../../utils/helpers/helper_functions.dart';

class VProductAttribute extends StatelessWidget {
  const VProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
        () => Column(
        children: [
          //Selected, Attribute and Pricing and description
          if (controller.selectedVariation.value.id.isNotEmpty)
            VRoundedContainer(
              padding: const EdgeInsets.all(VSizes.md),
              backgroundColor: dark ? VColors.primary : VColors.secondary,
              child: Column(
                //Title price and stocks
      
                children: [
                  Row(
                    children: [
                      const VSectionHeading(
                        title: 'Variation',
                        showActionButton: false,
                        textColor: VColors.light,
                      ),
                      const SizedBox(
                        width: VSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const VProductTitleText(
                                title: 'Price : ',
                                smallSize: true,
                              ),
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                const VProductPriceText(
                                  price:
                                      '₹{controller.selectedVariation.value.salePrice>0}',
                                  lineThrough: true,
                                ),
                              const SizedBox(
                                width: VSizes.spaceBtwItems,
                              ),
                              VProductPriceText(
                                price: controller.getVariationPrice(),
                              ),
                            ],
                          ),
                          //Stocks
      
                          Row(
                            children: [
                              const VProductTitleText(
                                title: 'Stock : ',
                                smallSize: true,
                              ),
                              VProductTitleText(
                                title: controller.variationStockStatus.value,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  //variation description
                  VProductTitleText(
                    title: controller.selectedVariation.value.description??'',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          const SizedBox(
            height: VSizes.spaceBtwItems,
          ),
      
          //Attributes
        ],
      ),
    );
  }
}
