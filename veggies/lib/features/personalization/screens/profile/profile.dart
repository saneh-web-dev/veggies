import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/common/widgets/images/v_circular_image.dart';
import 'package:veggies/common/widgets/shimmers/shimmer_loader.dart';
import 'package:veggies/common/widgets/texts/section_heading.dart';
import 'package:veggies/features/personalization/controllers/user_controller.dart';
import 'package:veggies/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:veggies/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const VAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : VImages.user;
                      return controller.imageUploading.value
                          ? const VShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : VCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              fit: BoxFit.fitHeight,
                              isNetworkImage: networkImage.isNotEmpty,
                              backgroundColor: Colors.green.shade400,
                            );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserprofilePicture(),
                      child: const Text('Change profile picture'),
                    ),
                  ],
                ),
              ),

              //Details
              const SizedBox(
                height: VSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),
              const VSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
// Heading profile menu
              VProfileMenu(
                onPressed: () => Get.to(() => const ChangeName()),
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              VProfileMenu(
                onPressed: () {},
                title: 'User Name',
                value: controller.user.value.userName,
              ),

              const SizedBox(
                height: VSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),

              //Personal info
              const VSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: VSizes.spaceBtwItems),

              VProfileMenu(
                onPressed: () {},
                title: 'User Id',
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),

              VProfileMenu(
                onPressed: () {},
                title: 'Email',
                value: controller.user.value.email,
              ),
              VProfileMenu(
                onPressed: () {},
                title: 'Phone',
                value: controller.user.value.phoneNumber,
              ),
              VProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              VProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '01/01/1990',
              ),

              const SizedBox(
                height: VSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),

              // close account text button
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
