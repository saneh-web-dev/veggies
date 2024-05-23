import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/v_circular_icon.dart';

class VProductQuantityWithAddOrRemove extends StatelessWidget {
  const VProductQuantityWithAddOrRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        VCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: VSizes.md,
          color: VColors.light,
          backgroundColor: dark ? VColors.secondary : VColors.primary,
        ),
        const SizedBox(
          width: VSizes.spaceBtwItems,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: VSizes.spaceBtwItems,
        ),
        VCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: VSizes.md,
          color: VColors.light,
          backgroundColor: dark ? VColors.secondary : VColors.primary,
        ),
      ],
    );
  }
}
