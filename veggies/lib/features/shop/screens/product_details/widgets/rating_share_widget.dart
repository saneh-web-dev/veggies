import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';

class VRatingAndShare extends StatelessWidget {
  const VRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //ratings
        Row(
          children: [
            const Icon(
              Iconsax.star,
              color: Colors.amber,
              size: 25,
            ),
            const SizedBox(
              width: VSizes.spaceBtwItems / 2,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: '4.5',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const TextSpan(text: '(199)')
            ]))
          ],
        ),

        //Share button
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.share,
            color: VColors.primary,
            size: VSizes.lg,
          ),
        )
      ],
    );
  }
}
