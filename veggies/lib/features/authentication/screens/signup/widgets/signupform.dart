import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:veggies/utils/validator/validation.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/signup/signup_controller.dart';

class VSignupForm extends StatelessWidget {
  const VSignupForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      VValidation.validateEmptytext('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: VTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: VSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      VValidation.validateEmptytext('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: VTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: VSizes.spaceBtwInputFields,
          ),
          //username
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                VValidation.validateEmptytext('User Name', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: VTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(
            height: VSizes.spaceBtwInputFields,
          ),

          //email
          TextFormField(
            controller: controller.email,
            validator: (value) => VValidation.validateEmptytext('Email', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: VTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(
            height: VSizes.spaceBtwInputFields,
          ),

          //phone number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) =>
                VValidation.validateEmptytext('Phone Number', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: VTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(
            height: VSizes.spaceBtwInputFields,
          ),

          //password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) =>
                  VValidation.validateEmptytext('Password', value),
              expands: false,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: VTexts.password,
                prefixIcon: const Icon(Iconsax.lock),
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: const Icon(Iconsax.eye_slash)),
              ),
            ),
          ),

          const SizedBox(
            height: VSizes.spaceBtwInputFields,
          ),

          //terms and conditions
          const VTermsConditionsCheckbox(),
          const SizedBox(
            height: VSizes.spaceBtwSections,
          ),
          //sign up button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () =>controller.signup(),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                backgroundColor: VColors.primary,
                foregroundColor: VColors.light
              ),
              child: const Text(VTexts.createAccount),
            ),
          )
        ],
      ),
    );
  }
}
