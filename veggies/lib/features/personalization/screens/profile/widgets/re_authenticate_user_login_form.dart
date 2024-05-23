import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/features/personalization/controllers/user_controller.dart';
import 'package:veggies/utils/constants/sizes.dart';
import 'package:veggies/utils/constants/text_strings.dart';
import 'package:veggies/utils/validator/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Re-Authenticate User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.reAuthFormKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              //email
              TextFormField(
                controller: controller.verifyEmail,
                validator: VValidation.validateEmail,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: VTexts.email),
              ),
              const SizedBox(
                height: VSizes.spaceBtwInputFields,
              ),
              //password
              Obx(
                () => TextFormField(
                  controller: controller.verifyPassword,
                  obscureText: controller.hidePassword.value,
                  validator: (value) =>
                      VValidation.validateEmptytext('Password', value),
                  decoration:  InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: VTexts.password,
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: const Icon(Iconsax.eye_slash))),
                ),
              ),
                  const SizedBox(
                    height: VSizes.spaceBtwSections,
                  ),
                  //submit button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: ()=> controller.reAuthenticateEmailAndPasswordUser(),
                      child: const Text('Login'),
                    ),
                  )
            ]),
          ),
        ),
      ),
    );
  }
}
