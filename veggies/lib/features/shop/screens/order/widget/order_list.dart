import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:veggies/utils/constants/color.dart';
import 'package:veggies/utils/constants/sizes.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';

class VOrderListItems extends StatelessWidget {
  const VOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: VSizes.spaceBtwItems,
      ),
      itemCount: 10,
      itemBuilder: (_, index) => VRoundedContainer(
        showBorder: true,
        backgroundColor: dark ? VColors.dark : VColors.light,
        padding: const EdgeInsets.all(VSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                //icons
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: VSizes.spaceBtwItems / 2,
                ),

                //status and dates
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: VColors.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        '04 May 2004',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),

                //icon
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_right_3,
                      size: VSizes.lg,
                    ))
              ],
            ),
            // Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      //icons
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: VSizes.spaceBtwItems / 2,
                      ),

                      //status and dates
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                      color: VColors.grey, fontWeightDelta: 1),
                            ),
                            Text(
                              '[#25636]',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      //icons
                      const Icon(Iconsax.calendar),
                      const SizedBox(
                        width: VSizes.spaceBtwItems / 2,
                      ),

                      //status and dates
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Date',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                      color: VColors.grey, fontWeightDelta: 1),
                            ),
                            Text(
                              '10-04-2003',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
