import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/constants/color.dart';

class VRatingBarIndicator extends StatelessWidget {
  const VRatingBarIndicator({
    super.key, required this.rating,
  });
final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      itemBuilder: (_, __) =>
      const Icon(Iconsax.star, color: VColors.primary),
    );
  }
}
