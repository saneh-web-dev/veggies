import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../data/repositories/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  // variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    final rememberMeEmail = localStorage.read('REMEMBER_ME_EMAIL');
    final rememberMePassword = localStorage.read('REMEMBER_ME_PASSWORD');
    if (rememberMeEmail != null) {
      email.text = rememberMeEmail;
    }
    if (rememberMePassword != null) {
      password.text = rememberMePassword;
    }
    super.onInit();
  }

  Future<void> emailAndPasswordAndSignIn() async {
    try {
// start loading
      VFullScreenLoader.openLoadingDialog(
          'Logging you in...', VImages.reloadAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!loginFormKey.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //Login user using email and password authentication
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //save user record
      await userController.saveUserRecord(userCredential);

      //Remove loader
      VFullScreenLoader.stopLoading();

      //Redirect to
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
// show generic error message to user
      VFullScreenLoader.stopLoading();
      VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
// start loading
      VFullScreenLoader.openLoadingDialog(
          'Logging you in...', VImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoading();
        return;
      }

      //Login user using google authentication
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredential);

      //Remove loader
      VFullScreenLoader.stopLoading();

      //Redirect to
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      VFullScreenLoader.stopLoading();
      VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
