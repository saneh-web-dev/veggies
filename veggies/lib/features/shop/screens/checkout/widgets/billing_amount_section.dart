import 'package:flutter/material.dart';
import 'package:veggies/utils/constants/sizes.dart';

import '../../../../../utils/constants/color.dart';

class VBillingAmountSection extends StatelessWidget {
  const VBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //subTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: Theme.of(context).textTheme.bodyMedium!.apply(color: VColors.light),
            ),
            Text(
              '\$100',
              style: Theme.of(context).textTheme.labelLarge!.apply(fontWeightDelta: 10,color: VColors.light),
            ),
          ],
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),
        //Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping fee',
              style: Theme.of(context).textTheme.bodyMedium!.apply(color: VColors.light),
            ),
            Text(
              '\$100',
              style: Theme.of(context).textTheme.labelLarge!.apply(fontWeightDelta: 10,color: VColors.light),
            ),
          ],
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'GST',
              style: Theme.of(context).textTheme.bodyMedium!.apply(color: VColors.light),
            ),
            Text(
              '5%',
              style: Theme.of(context).textTheme.labelLarge!.apply(fontWeightDelta: 10,color: VColors.light),
            ),
          ],
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order Total',
              style: Theme.of(context).textTheme.bodyMedium!.apply(color: VColors.light),
            ),
            Text(
              '\$100',
              style: Theme.of(context).textTheme.labelLarge!.apply(fontWeightDelta: 10,color: VColors.light),
            ),
          ],
        ),
      ],
    );
  }
}
