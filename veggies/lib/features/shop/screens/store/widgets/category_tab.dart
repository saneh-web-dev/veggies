import 'package:flutter/material.dart';
import 'package:veggies/common/widgets/layouts/grid_layout.dart';
import 'package:veggies/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:veggies/common/widgets/texts/section_heading.dart';
import 'package:veggies/features/shop/models/category_model.dart';
import 'package:veggies/features/shop/models/product_model.dart';

import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class VCategoryTab extends StatelessWidget {
  const VCategoryTab({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          //Brands
          children: [
            // top brands
            const VBrandShowcase(images: [
              VImages.masala,
              VImages.banana,
              VImages.coconutOil
            ]),
            //Products
            VSectionHeading(
              title: 'You might like',
              onPressed: () {},
            ),
            const SizedBox(
              height: VSizes.spaceBtwItems,
            ),
            VGridLayout(
              itemCount: 10,
              itemBuilder: (_, index) =>  VProductCartVertical(product: ProductModel.empty(),),
            ),
            const SizedBox(height: VSizes.spaceBtwSections,),
          ],
        ),
      ),]
    );
  }
}
