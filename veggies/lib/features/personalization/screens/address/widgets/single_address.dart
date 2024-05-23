import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class VSingleAddress extends StatelessWidget {
  const VSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return VRoundedContainer(
      padding: const EdgeInsets.all(VSizes.sm),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? VColors.secondary.withOpacity(0.8)
          : VColors.transparent,
      borderColor: selectedAddress
          ? VColors.transparent
          : dark
              ? VColors.darkgrey
              : VColors.grey,
      margin: const EdgeInsets.only(bottom: VSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle : null,
              color: selectedAddress
                  ? dark
                      ? VColors.light
                      : VColors.light
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sourabh singh',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: VSizes.sm / 2,
              ),
              const Text(
                '+91 9876543210',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
               ),
              const SizedBox(
                height: VSizes.sm / 2,
              ),
              Text(
                'Kanakpura ,jhotwara,Jaipur,Rajasthan,India,Earth',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: VSizes.sm / 2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
