

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:veggies/common/widgets/loaders/loaders.dart';
import 'package:veggies/data/repositories/authentication_repository.dart';
import 'package:veggies/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:veggies/utils/constants/image_strings.dart';
import 'package:veggies/utils/helpers/network_manager.dart';
import 'package:veggies/utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  //variables
final email = TextEditingController();
GlobalKey<FormState> forgetPasswordFormKey =  GlobalKey<FormState>();

//send reset password email
sendPasswordResetEmail() async {
  try{
    //start loading
    VFullScreenLoader.openLoadingDialog('Processing your request...', VImages.reloadAnimation2);

    //check internet connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if(isConnected) {VFullScreenLoader.stopLoading(); return;}

    //form validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        VFullScreenLoader.stopLoading();
        return;
      }

      //send email to reset password
    await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //remove loader
    VFullScreenLoader.stopLoading();

    //show success screen
    VLoaders.successSnackBar(title: 'Email sent',message: 'Email sent to reset your password'.tr);

    //redirect
    Get.to(()=>ResetPassword(email:email.text.trim()));
  } catch(e){
    //remove loader
    VFullScreenLoader.stopLoading();

    //show error screen
    VLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString().tr);
  }
}

resendPasswordResetEmail(String email) async {
  try{
    //start loading
    VFullScreenLoader.openLoadingDialog('Processing your request...', VImages.reloadAnimation2);

    //check internet connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if(isConnected) {VFullScreenLoader.stopLoading(); return;}


    //send email to reset password
    await AuthenticationRepository.instance.sendPasswordResetEmail(email);

    //remove loader
    VFullScreenLoader.stopLoading();

    //show success screen
    VLoaders.successSnackBar(title: 'Email sent',message: 'Email sent to reset your password'.tr);

  } catch(e){
    //remove loader
    VFullScreenLoader.stopLoading();

    //show error screen
    VLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString().tr);
  }
}

}