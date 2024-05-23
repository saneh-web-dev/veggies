import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/texts/section_heading.dart';
import 'package:veggies/utils/constants/sizes.dart';

import '../../../../../utils/constants/color.dart';

class VBillingAddressSection extends StatelessWidget {
  const VBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text('Sourabh singh', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Iconsax.mobile,
              color: VColors.grey,
              size: 16,
            ),
            const SizedBox(
              width: VSizes.spaceBtwItems,
            ),
            Text(
              '+91 98989898989',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

          ],
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(Iconsax.location,
                color: VColors.grey, size: 16),
            const SizedBox(width: VSizes.spaceBtwItems),
            Expanded(
                child: Text(
                  'Kanapura Jhotwara Jaipur ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  softWrap: true,
                ))
          ],
        )
      ],
    );
  }
}
