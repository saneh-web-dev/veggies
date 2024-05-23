import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/onboarding/login/login.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  //variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // update current index when page scroll
void updatePageIndicator(index)=> currentPageIndex.value = index;

  // jump to specific dot selected page
void dotNavigationClick(index){
  currentPageIndex.value = index;
  pageController.jumpTo(index);
}

  //update current index when page scroll
void nextPage(){
if(currentPageIndex.value == 2){
  final storage = GetStorage();
  if(kDebugMode){
    print('======= Get Storage =====');
    print(storage.read('isFirstTime'));
  }

  storage.write('isFirstTime', false);

  if(kDebugMode){
    print('======= Get Storage =====');
    print(storage.read('isFirstTime'));
  }


  Get.offAll(const LoginScreen());
}else{
  int page = currentPageIndex.value + 1;
  pageController.jumpToPage(page);

}
}

  //update current index and jump to last page
void skipPage(){
  currentPageIndex.value = 2;
  pageController.jumpToPage(2);
}
}