import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/icons/v_circular_icon.dart';
import 'package:veggies/utils/constants/sizes.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/color.dart';

class VBottomAddToCart extends StatelessWidget {
  const VBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace,vertical: VSizes.defaultSpace/2),
      decoration: BoxDecoration(
        color: dark?VColors.secondary:VColors.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(VSizes.cardRadiusLg),
          topRight: Radius.circular(VSizes.cardRadiusLg),
        ),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Row(
            children:   [
            const  VCircularIcon(
                  icon: Iconsax.minus_copy,
                backgroundColor: VColors.primary,
                width: 40,
                height: 40,
                color: VColors.light,
              ),
             const SizedBox(width: VSizes.spaceBtwItems,),
              Text('2',style: Theme.of(context).textTheme.titleSmall,),
            const  SizedBox(width: VSizes.spaceBtwItems,),
            const   VCircularIcon(
                  icon: Iconsax.add_copy,
                backgroundColor: VColors.primary,
                color:VColors.light,
                width: 40,
              height: 40,
            ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(VSizes.md),
              backgroundColor: VColors.primary,
              foregroundColor:VColors.light,
              side:const BorderSide(color: VColors.light),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(VSizes.cardRadiusLg),
              ),
            ),
              onPressed: (){},
              child: const Text('Add to Cart'),)
        ],
      ),
    );
  }
}
