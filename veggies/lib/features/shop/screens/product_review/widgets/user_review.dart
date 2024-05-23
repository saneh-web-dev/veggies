import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            const CircleAvatar(
              backgroundImage: AssetImage(VImages.user),
            ),
            const SizedBox(
              width: VSizes.spaceBtwItems,
            ),
            Text('sourabh singh',
                style: Theme.of(context).textTheme.titleLarge),
          ]),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      const SizedBox(
        height: VSizes.spaceBtwItems,
      ),

      //Reviews
      Row(children: [
        const VRatingBarIndicator(
          rating: 4,
        ),
        const SizedBox(width: VSizes.spaceBtwItems),
        Text('07 Oct,2010', style: Theme.of(context).textTheme.bodyMedium),
      ]),
      const SizedBox(
        height: VSizes.spaceBtwItems,
      ),
      const ReadMoreText(
        'User interface of the app is very nice i am ablge to get best green vegetables',
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimExpandedText: (' Show  less '),
        moreStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: VColors.primary),
        trimCollapsedText: (' Show more'),
        lessStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: VColors.primary),
      ),
      const SizedBox(
        height: VSizes.spaceBtwItems,
      ),

      //company review
      VRoundedContainer(
          backgroundColor: dark ? VColors.grey : VColors.grey,
          child: Padding(
              padding: const EdgeInsets.all(VSizes.md),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("V's Store",
                          style: Theme.of(context).textTheme.titleMedium),
                      Text("07 Oct 2003",
                          style: Theme.of(context).textTheme.bodyLarge),
                    ]),
                const ReadMoreText(
                  'User interface of the app is very nice i am ablge to get best green vegetables',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: (' Show  less '),
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: VColors.primary),
                  trimCollapsedText: (' Show more'),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: VColors.primary),
                ),
              ]))),
      const SizedBox(height: VSizes.spaceBtwItems)
    ]);
  }
}
