import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:veggies/features/authentication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = VHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom:VDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: VSizes.defaultSpace,

      child:SmoothPageIndicator(
        effect:ExpandingDotsEffect(activeDotColor:dark?VColors.light:VColors.dark,dotHeight:6,),
        controller:controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count:3,
      ),
    );
  }
}

