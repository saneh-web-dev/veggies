import 'package:flutter/material.dart';
import 'package:veggies/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:veggies/common/widgets/texts/section_heading.dart';
import 'package:veggies/utils/constants/sizes.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/image_strings.dart';

class VBillingPaymentSection extends StatelessWidget {
  const VBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        VSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(
          height: VSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            VRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? VColors.dark : VColors.light,
              padding: const EdgeInsets.all(VSizes.sm),
              child: const Image(
                image: AssetImage(VImages.phonePeIcon),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: VSizes.spaceBtwItems / 2,),
            Text('PhonePe',style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
