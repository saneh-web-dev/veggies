import 'package:flutter/material.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';

import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
class VLoginHeader extends StatelessWidget {
  const VLoginHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
final dark = VHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 180,
          image: AssetImage(
              dark ? VImages.lightAppLogo : VImages.darkAppLogo),
        ),
        Text(
          VTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: VSizes.sm,
        ),
        Text(
          VTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}