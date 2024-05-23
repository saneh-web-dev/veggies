import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';
import 'package:veggies/utils/validator/validation.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            Image(
              height: 180,
              image:
                  AssetImage(dark ? VImages.lightAppLogo : VImages.darkAppLogo),
            ),
            //heading
            Text(
              VTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: VSizes.spaceBtwItems,
            ),
            Text(
              VTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: VSizes.spaceBtwSections * 2,
            ),

            //Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                validator: VValidation.validateEmail,
                controller: controller.email,
                decoration: const InputDecoration(
                  labelText: VTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(
              height: VSizes.spaceBtwSections,
            ),

            //Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(VTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
