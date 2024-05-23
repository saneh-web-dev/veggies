import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/features/authentication/controllers/login/login_controller.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
class VSocialButtons extends StatelessWidget {
  const VSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color:VColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: VSizes.iconMd,
              height: VSizes.iconMd,
              image: AssetImage(VImages.googleIcon),
            ),
          ),
        ),
        const SizedBox(width: VSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color:VColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: VSizes.iconMd,
              height: VSizes.iconMd,
              image: AssetImage(VImages.fbIcon),
            ),
          ),
        ),
      ],
    );
  }
}