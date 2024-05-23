import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/common/widgets/login_signup/form_divider.dart';
import 'package:veggies/common/widgets/login_signup/social_buttons.dart';
import 'package:veggies/features/authentication/screens/signup/widgets/signupform.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: VSizes.spaceBtwSections * 1.8),
              //title
              Text(
                VTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: VSizes.spaceBtwSections),
              //form
             const VSignupForm(),
              const SizedBox(
                height: VSizes.spaceBtwSections,
              ),
              //Divider
              VFormDivider(dividerText: VTexts.orSignUpWith.capitalize!),
              const SizedBox(
                height: VSizes.spaceBtwSections,
              ),
              //social buttons
              const VSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


