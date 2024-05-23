import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:veggies/features/authentication/screens/signup/signup.dart';
import 'package:veggies/utils/validator/validation.dart';

import '../../../../../../utils/constants/color.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';
import '../../../../controllers/login/login_controller.dart';

class VLoginForm extends StatelessWidget {
  const VLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: VSizes.spaceBtwSections),
        child: Column(
          children: [
            //email
            TextFormField(
              controller: controller.email,
              validator: (value) => VValidation.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: VTexts.email,
              ),
            ),

            const SizedBox(
              height: VSizes.spaceBtwInputFields,
            ),
            //password
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) =>
                    VValidation.validateEmptytext('Password', value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: VTexts.password,
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye)),
                ),
              ),
            ),
            const SizedBox(
              height: VSizes.spaceBtwInputFields / 2,
            ),
            //remember me checkbox and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                        activeColor: VColors.primary,
                      ),
                    ),
                    const Text(VTexts.rememberMe),
                  ],
                ),
                //Forgot Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(VTexts.forgotPassword))
              ],
            ),
            const SizedBox(
              height: VSizes.spaceBtwSections,
            ),

            //login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordAndSignIn(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(VSizes.borderRadiusMd),
                  ),
                  backgroundColor: VColors.primary,
                ),
                child: const Text(VTexts.signIn),
              ),
            ),
            const SizedBox(
              height: VSizes.spaceBtwItems,
            ),
            //signup button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(VSizes.borderRadiusMd),
                  ),
                  side: const BorderSide(color: VColors.primary),
                ),
                child: const Text(VTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
