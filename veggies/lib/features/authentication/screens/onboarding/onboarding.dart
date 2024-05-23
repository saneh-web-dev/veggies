import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:veggies/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:veggies/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:veggies/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:veggies/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
const OnBoardingScreen({super.key}); // ONBOARDING ONBOARDING
@override
  Widget build(BuildContext context) {
  final controller = Get.put(OnBoardingController());


  return Scaffold(
  body: Stack(
    children: [
      //Horizontal scrollable page
      PageView(
        controller: controller.pageController,
        onPageChanged:controller.updatePageIndicator,
        children:const [
          OnBoardingPage(
            image: VImages.onBoarding1,
            title: VTexts.onBoardingTitle1,
            subtitle: VTexts.onBoardingSubTitle1,
          ),
          OnBoardingPage(
            image: VImages.onBoarding2,
            title: VTexts.onBoardingTitle2,
            subtitle: VTexts.onBoardingSubTitle2,
          ),
          OnBoardingPage(
            image: VImages.onBoarding3,
            title: VTexts.onBoardingTitle3,
            subtitle: VTexts.onBoardingSubTitle3,
          )
        ],
      ),

      // skip button
     const OnBoardingSkip(),

      //Dot navigation smooth page
    const OnBoardingDotNavigation(),

      // circular button
   const OnBoardingNextButton()
    ],
  ),
  );
}
}

