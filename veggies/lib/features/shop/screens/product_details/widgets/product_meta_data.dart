import 'package:flutter/material.dart';
import 'package:veggies/common/widgets/images/v_circular_image.dart';
import 'package:veggies/common/widgets/texts/product_price_text.dart';
import 'package:veggies/common/widgets/texts/product_title_text.dart';
import 'package:veggies/common/widgets/texts/v_brand_title_text.dart';
import 'package:veggies/features/shop/controllers/product_controller.dart';
import 'package:veggies/features/shop/models/product_model.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class VProductMetaData extends StatelessWidget {
  const VProductMetaData({super.key, required  this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Price and sale price
        Row(
          children: [
            //Sale tag
            VRoundedContainer(
              radius: VSizes.sm,
              backgroundColor: dark?VColors.primary:VColors.secondary,
              padding: const EdgeInsets.symmetric(
                  horizontal: VSizes.sm, vertical: VSizes.xs),
              child: Text(
                '$salePercentage',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: VColors.light),
              ),
            ),
            const SizedBox(
              width: VSizes.spaceBtwItems,
            ),
            //price
            const VProductPriceText(
              price: '30/kg',
              lineThrough: true,
            ),
            const SizedBox(
              width: VSizes.spaceBtwItems,
            ),
             VProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
//Product Title
       VProductTitleText(title: product.title),
        const SizedBox(height: VSizes.spaceBtwItems / 1.5 ,),

        //stock status
       const  VProductTitleText(title: 'Status'),
        Text(controller.getProductStockStatus(product.stock),style: Theme.of(context).textTheme.titleMedium,),
        const SizedBox(height: VSizes.spaceBtwItems / 1.5 ,),

        //Brand
        const Row(
          children: [
            VCircularImage(
                image: VImages.vegetableIcon,
              width: 32,
              height: 32,
            ),
            VBrandTitleWithVerifiedIcon(title: 'Meri Sabji')
          ],
        )
      ],
    );
  }
}
