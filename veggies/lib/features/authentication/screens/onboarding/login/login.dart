import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/common/styles/spacing_styles.dart';
import 'package:veggies/features/authentication/screens/onboarding/login/widgets/login_form.dart';
import 'package:veggies/features/authentication/screens/onboarding/login/widgets/login_header.dart';
import 'package:veggies/utils/constants/text_strings.dart';
import '../../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../../utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: VSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            //logo title and subtitle
           const VLoginHeader(),
           const VLoginForm(),
            //Divider
            VFormDivider(dividerText:VTexts.orSignInWith.capitalize!),

            const SizedBox(height: VSizes.spaceBtwSections,),
            //footer with social icons
         const   VSocialButtons(),
          ],
        ),
      )),
    );
  }
}








