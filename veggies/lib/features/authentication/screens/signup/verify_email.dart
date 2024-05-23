import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/data/repositories/authentication_repository.dart';
import 'package:veggies/features/authentication/controllers/signup/signup_controller.dart';
import 'package:veggies/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              //image
              Image(
                image: const AssetImage(VImages.mailGif),
                width: VHelperFunctions.screenWidth(),
              ),
              const SizedBox(
                height: VSizes.spaceBtwSections,
              ),

              //title and subtitle
              Text(
                VTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                VTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),
              //buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () =>
                      Get.to(() => SignupController.instance.signup()),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(VSizes.borderRadiusMd),
                    ),
                    backgroundColor: VColors.primary,
                    foregroundColor: VColors.light,
                  ),
                  child: const Text(VTexts.vContinue),
                ),
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(VTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
