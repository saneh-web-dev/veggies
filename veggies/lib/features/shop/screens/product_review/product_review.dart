import 'package:flutter/material.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/features/shop/screens/product_review/widgets/rating_progress_indicator.dart';
import 'package:veggies/features/shop/screens/product_review/widgets/user_review.dart';
import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';

class VProductReview extends StatelessWidget {
  const VProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: const VAppBar(
        title: Text('Reviews and Ratings'),
        showBackArrow: true,
      ),

      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified by the people who uses the same device as you.'),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),
//overall product review
              const VOverallProductRating(),

              //rating indicator
              const VRatingBarIndicator(
                rating: 3.5,
              ),
              Text('123,56', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: VSizes.spaceBtwItems),
              //user review card
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
