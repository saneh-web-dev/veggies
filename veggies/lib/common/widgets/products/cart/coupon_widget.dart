import 'package:flutter/material.dart';

import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class VCouponCode extends StatelessWidget {
  const VCouponCode({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return VRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.only(
          top: VSizes.sm,
          left: VSizes.md,
          bottom: VSizes.sm,
          right: VSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Have a promo code? Enter here',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )),
            ),
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(VSizes.sm),
                  ),
                  backgroundColor: dark?VColors.secondary:VColors.primary,
                  foregroundColor: VColors.light
              ),
              child: const Text('Apply')
          ),
        ],
      ),
    );
  }
}
