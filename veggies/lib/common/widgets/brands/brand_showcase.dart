import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brands_card.dart';

class VBrandShowcase extends StatelessWidget {
  const VBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {

    return VRoundedContainer(
      showBorder: true,
      borderColor: VColors.primary,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: VSizes.spaceBtwItems),
      child: Column(
        children: [
          //brands with products count
          const VBrandCard(
            showBorder: false,
            title: 'Vegetables',
          ),
          const SizedBox(height: VSizes.spaceBtwItems,),
          //brands top selling products
          Row(
              children:
              images.map((image) => brandTopImageProductImage(image, context)).toList()

          )
        ],
      ),
    );
  }

  Widget brandTopImageProductImage(String image, context) {
    return Expanded(
      child: VRoundedContainer(
        height: 70,
        showBorder: false,
        backgroundColor: Colors.green.shade50,
        margin: const EdgeInsets.all(VSizes.sm),
        // padding: const EdgeInsets.all(VSizes.sm),
        child:  Image(
          fit: BoxFit.contain,
          image: AssetImage(image,),

        ),
      ),
    );
  }
}
