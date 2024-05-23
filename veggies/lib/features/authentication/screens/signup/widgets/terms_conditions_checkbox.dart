import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:veggies/features/authentication/controllers/signup/signup_controller.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class VTermsConditionsCheckbox extends StatelessWidget {
  const VTermsConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = VHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Obx(
                  () =>
                  Checkbox(
                    value: controller.privacyPolicy.value,
                    onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
                  ),
            ),
          ),
          const SizedBox(
            width: VSizes.spaceBtwItems,
          ),
          Flexible(
            // Wrap the Text widget with Flexible
            fit: FlexFit.loose, // Allow the Text widget to wrap

            child: Text.rich(
              overflow: TextOverflow.clip,
              TextSpan(children: [
                TextSpan(
                  text: VTexts.isAgreeTo,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                ),
                TextSpan(
                  text: VTexts.privacyPolicy,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                    color: dark ? VColors.primary : VColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? VColors.light : VColors.primary,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                ),
                TextSpan(
                  text: VTexts.termsOfUse,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                    color: dark ? VColors.primary : VColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? VColors.light : VColors.primary,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
