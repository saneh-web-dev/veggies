import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/utils/constants/text_strings.dart';
import 'package:veggies/utils/validator/validation.dart';

import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: VAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User real name for easy verification. This name will appear on multiple pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: VSizes.spaceBtwSections,
            ),

            //Text form fields
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          VValidation.validateEmptytext('First Name', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: VTexts.firstName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(
                      height: VSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          VValidation.validateEmptytext('Last Name', value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: VTexts.lastName,
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(
                      height: VSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.updateUserName(),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: VColors.primary,
                          foregroundColor: VColors.light,
                        ),
                        child: const Text('Update'),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
