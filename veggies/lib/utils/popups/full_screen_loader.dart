import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/color.dart';

class VFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
              canPop: false,
              child: Container(
                color: VHelperFunctions.isDarkMode(Get.context!)
                    ? VColors.light
                    : VColors.primary,
                width: double.infinity,
                height: double.infinity,
                child:  Column(
                  children: [
                    const SizedBox(
                      height: 250,),
                       VAnimationLoaderWidget(text:text,animation:animation),

                  ],
                ),
              ),
            )
    );
  }
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}


