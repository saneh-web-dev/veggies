import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:veggies/common/widgets/loaders/loaders.dart';
import 'package:veggies/data/repositories/authentication_repository.dart';
import 'package:veggies/data/repositories/user/user_repository.dart';
import 'package:veggies/features/authentication/screens/signup/verify_email.dart';
import 'package:veggies/utils/popups/full_screen_loader.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../personalization/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final hidePassword = true.obs;
  final email = TextEditingController(); // controller for email input
  final privacyPolicy = true.obs;
  final lastName = TextEditingController(); // controller for last name input
  final firstName = TextEditingController(); // controller for first name input
  final password = TextEditingController(); // controller for password input
  final userName = TextEditingController(); // controller for user name input
  final phoneNumber =
      TextEditingController(); // controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //form key for form validation
//Signup

  void signup() async {
    try {
// start loading
      VFullScreenLoader.openLoadingDialog(
          'We are processing your information securely',
          VImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        VFullScreenLoader.stopLoading();

        return;
      }
      //privacy policy check
      if (!privacyPolicy.value) {
        VLoaders.warningSnackBar(
            title: 'Accept privacy policy',
            message:
                'In order to create account , you must check and read Privacy Policy & Terms of Use');
        return;
      }

      //Register user in firebase auth and save user data in firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save authentication user data in firebase
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        userName: userName.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove loader
      VFullScreenLoader.stopLoading();

      //show success message
      VLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');
      //move to email verification screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
// show generic error message to user
      VLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
// remove loaders
      VFullScreenLoader.stopLoading();
    }
  }
}
