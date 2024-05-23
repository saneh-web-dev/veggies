
import 'package:get/get.dart';
import 'package:veggies/features/authentication/screens/onboarding/login/login.dart';
import 'package:veggies/features/authentication/screens/onboarding/onboarding.dart';
import 'package:veggies/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:veggies/features/authentication/screens/signup/signup.dart';
import 'package:veggies/features/authentication/screens/signup/verify_email.dart';
import 'package:veggies/features/personalization/screens/address/address.dart';
import 'package:veggies/features/personalization/screens/profile/profile.dart';
import 'package:veggies/features/shop/screens/cart/cart.dart';
import 'package:veggies/features/shop/screens/checkout/checkout.dart';
import 'package:veggies/features/shop/screens/home/home.dart';
import 'package:veggies/features/shop/screens/order/order.dart';
import 'package:veggies/features/shop/screens/product_review/product_review.dart';
import 'package:veggies/routes/routes.dart';

import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/store/store.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: VRoutes.home, page: ()=> const HomeScreen()),
    GetPage(name: VRoutes.store, page: ()=> const StoreScreen()),
    // GetPage(name: VRoutes.favorites, page: ()=> const FavouriteScreen()),
    GetPage(name: VRoutes.settings, page: ()=> const SettingsScreen()),
    GetPage(name: VRoutes.productReviews, page: ()=> const VProductReview()),
    GetPage(name: VRoutes.order, page: ()=> const VOrderScreen()),
    GetPage(name: VRoutes.checkout, page: ()=> const VCheckoutScreen()),
    GetPage(name: VRoutes.cart, page: ()=> const VCartScreen()),
    GetPage(name: VRoutes.userProfile, page: ()=> const ProfileScreen()),
    GetPage(name: VRoutes.userAddress, page: ()=> const AddressScreen()),
    GetPage(name: VRoutes.signUp, page: ()=> const SignUpScreen()),
    GetPage(name: VRoutes.signIn, page: ()=> const LoginScreen()),
    GetPage(name: VRoutes.forgotPassword, page: ()=> const ForgetPassword()),
    GetPage(name: VRoutes.onBoarding, page: ()=> const OnBoardingScreen()),
    GetPage(name: VRoutes.verifyEmail, page: ()=> const VerifyEmailScreen(email: '',)),
  ];
}