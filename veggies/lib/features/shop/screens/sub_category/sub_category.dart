import 'package:flutter/material.dart';
import 'package:veggies/common/widgets/images/v_rounded_images.dart';
import 'package:veggies/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:veggies/common/widgets/texts/section_heading.dart';
import 'package:veggies/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/image_strings.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VAppBar(
        title: Text('Sub Category'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              //Banner
              const VRoundedImage(
                imageUrl: VImages.promoBanner2,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: VSizes.spaceBtwSections,
              ),
              //Sub Category
              Column(
                children: [
                  //heading
                  VSectionHeading(
                    title: 'Vegetables',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: VSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          const VProductCardHorizontal(),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: VSizes.spaceBtwItems,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
