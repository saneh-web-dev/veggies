import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:veggies/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:veggies/common/widgets/texts/section_heading.dart';
import 'package:veggies/data/repositories/authentication_repository.dart';
import 'package:veggies/features/shop/screens/order/order.dart';
import '../../../../common/widgets/list_tile/user_profile_tile.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import '../address/address.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AuthenticationRepository.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            VPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  VAppBar(
                    title: Text(
                      'Accounts',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: VColors.light),
                    ),
                  ),
                  //user profile card
                  VUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen()),
                  ),
                  const SizedBox(
                    height: VSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            //Body
            Padding(
              padding: const EdgeInsets.all(VSizes.defaultSpace),
              child: Column(
                children: [
                  // Account Settings
                  const VSectionHeading(title: 'Account Settings'),
                  const SizedBox(
                    height: VSizes.spaceBtwSections,
                  ),

                  // Settings Menu
                  VSettingsMenuTile(
                    icon: Iconsax.home_2_copy,
                    title: 'My Address',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const AddressScreen()),
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.shopping_bag,
                    title: 'My Cart',
                    subTitle: 'Add,remove products and move to checkout',
                    onTap: () {},
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-Progress or Completed orders',
                    onTap: () => Get.to(() => const VOrderScreen()),
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'Get discount on your new orders',
                    onTap: () {},
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle:
                        "Don't miss the discounts ! Turn on the notification now",
                    onTap: () {},
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage Data usage and connected Accounts',
                    onTap: () {},
                  ),

                  // App settings
                  const SizedBox(
                    height: VSizes.spaceBtwSections,
                  ),
                  const VSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: VSizes.spaceBtwSections,
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to your Database,Safe and Clear',
                    onTap: () {},
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendations for location',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: VColors.primary,
                    ),
                  ),
                  VSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is Safe for all ages',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                      activeColor: VColors.primary,
                    ),
                  ),
                  VSettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subTitle: 'Set image quality to be seen',
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: VColors.primary,
                      )),

                  //Logout Button
                  const SizedBox(
                    height: VSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => controller.logout(),
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(
                    height: VSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
