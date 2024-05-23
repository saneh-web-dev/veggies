// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:veggies/features/authentication/screens/onboarding/login/login.dart';
// import 'package:veggies/utils/constants/image_strings.dart';
// import 'package:veggies/utils/constants/sizes.dart';
// import 'package:veggies/utils/constants/text_strings.dart';
//
// class VerifyEmailScreen extends StatelessWidget {
//   const VerifyEmailScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//               onPressed: () => Get.offAll(() => const LoginScreen()),
//               icon: const Icon(Iconsax.tag_cross_copy))
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(VSizes.defaultSpace),
//           child: Column(
//             children: [
//               const Image(image: AssetImage(VImages.mailGif)),
//               const SizedBox(height: VSizes.defaultSpace),
//               Text(
//                 VTexts.confirmEmail,
//                 style: Theme.of(context).textTheme.headlineMedium,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: VSizes.spaceBtwItems,)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:veggies/common/widgets/loaders/loaders.dart';
import 'package:veggies/common/widgets/success_screen/success_screen.dart';

import '../../../../data/repositories/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // send email whenever verify screen open

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      VLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your email for verification link');
    } catch (e) {
      VLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    }
  }

//timer to automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: VImages.mailGif,
            title: VTexts.yourAccountCreatedTitle,
            subTitle: VTexts.yourAccountCreatedSubTitle,
        onPressed: ()=>AuthenticationRepository.instance.screenRedirect(),
        ));
      }
    });
  }
//manually check if email verified
checkEmailVerificationStatus() async {
  final currentUser =  FirebaseAuth.instance.currentUser;
  if(currentUser != null && currentUser.emailVerified) {
    Get.off(() => SuccessScreen(
      image: VImages.mailGif ,
      title: VTexts.yourAccountCreatedTitle,
      subTitle: VTexts.yourAccountCreatedSubTitle,
      onPressed: ()=>AuthenticationRepository.instance.screenRedirect(),
    ));
  }
}
}
