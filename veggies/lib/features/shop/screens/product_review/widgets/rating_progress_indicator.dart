import 'package:flutter/material.dart';
import 'package:veggies/features/shop/screens/product_review/widgets/progress_indicator_and_rating.dart';

class VOverallProductRating extends StatelessWidget {
  const VOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              '4.8',
              style: Theme.of(context).textTheme.displayLarge,
            )),
        const Expanded(
            flex: 7,
            child: Column(
              children: [
                VRatingProgressIndicator(text: '5', value: 0.8,),
                VRatingProgressIndicator(text: '4', value: 0.3,),
                VRatingProgressIndicator(text: '3', value: 0.4,),
                VRatingProgressIndicator(text: '2', value: 0.7,),
                VRatingProgressIndicator(text: '1', value: 0.2,),
              ],
            ))
      ],
    );
  }
}
