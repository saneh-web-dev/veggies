import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/common/widgets/loaders/loaders.dart';
import 'package:veggies/features/personalization/controllers/user_controller.dart';
import 'package:veggies/features/personalization/screens/profile/profile.dart';
import 'package:veggies/utils/helpers/network_manager.dart';
import 'package:veggies/utils/popups/full_screen_loader.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      VFullScreenLoader.openLoadingDialog(
          'We are updating your information...', VImages.reloadAnimation2);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }
      //update user first and last name in firestore
      Map<String, dynamic> name = {
        'First Name': firstName.text.trim(),
        'Last Name': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      //update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove loader
      VFullScreenLoader.stopLoading();

      //show success message
      VLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your name has been updated successfully');

      //move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      VFullScreenLoader.stopLoading();
      if (e is FirebaseException) {
        // Handle validation errors
        VLoaders.errorSnackBar(title: 'Validation Error', message: e.toString());
      } else {
        // Handle other errors
        VLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      }
    }
  }
}
