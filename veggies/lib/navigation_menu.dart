import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/features/personalization/screens/settings/settings.dart';
import 'package:veggies/features/shop/screens/home/home.dart';
import 'package:veggies/features/shop/screens/store/store.dart';
import 'package:veggies/features/shop/screens/wishlist/wishlist.dart';
import 'package:veggies/utils/constants/color.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
bottomNavigationBar:Obx
      (()=>NavigationBar(
  height: 70,
  elevation: 0,
  selectedIndex: controller.selectedindex.value,
  onDestinationSelected: (index)=>controller.selectedindex.value = index,
  backgroundColor: dark ? VColors.dark : VColors.light,
  indicatorColor: dark ? VColors.light.withOpacity(0.1) : VColors.black.withOpacity(0.1),
  destinations: const [
    NavigationDestination(icon:  Icon(Iconsax.home), label:'Home',),
    NavigationDestination(icon:  Icon(Iconsax.shop), label:'Store',),
    NavigationDestination(icon:  Icon(Iconsax.heart), label:'Wishlist',),
    NavigationDestination(icon:  Icon(Iconsax.user), label:'Profile',),
  ],
),
),
      body: Obx(()=>controller.screens[controller.selectedindex.value]),
    );
  }
}

class NavigationController extends GetxController {
final RxInt selectedindex = 0.obs;
final screens = [
  const HomeScreen(),
  const StoreScreen(),
  const WishlistScreen(),
  const SettingsScreen(),
];
}
