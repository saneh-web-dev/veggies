import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:veggies/common/widgets/loaders/loaders.dart';
import 'package:veggies/data/repositories/authentication_repository.dart';
import 'package:veggies/features/authentication/screens/onboarding/login/login.dart';
import 'package:veggies/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:veggies/utils/constants/sizes.dart';
import 'package:veggies/utils/helpers/network_manager.dart';
import 'package:veggies/utils/popups/full_screen_loader.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetail();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // convert name to first and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? "");
          final userName = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          //map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : ' ',
            userName: userName,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          //save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      VLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your record. you can re-save your data in your profile');
    }
  }

  //delete account warnings
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(VSizes.md),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete your account?',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            // side: const BorderSide(color: Colors.red),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: VSizes.sm),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  //delete user account
  void deleteUserAccount() async {
    try {
      VFullScreenLoader.openLoadingDialog(
          'Processing...', VImages.reloadAnimation);

      //first reauthenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
//re verify auth mail
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          VFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          VFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      VFullScreenLoader.stopLoading();
      VLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

//re authentication before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      VFullScreenLoader.openLoadingDialog(
          'Processing...', VImages.reloadAnimation);

//check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        VFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        VFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      VFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      VFullScreenLoader.stopLoading();
      VLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  uploadUserprofilePicture() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512);

    try {
      if (image != null) {
        imageUploading.value = true;
        //upload image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile', image);

        //update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;

        user.refresh();

        VLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your profile image has been uploaded');
      }
    } catch (e) {
      VLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
