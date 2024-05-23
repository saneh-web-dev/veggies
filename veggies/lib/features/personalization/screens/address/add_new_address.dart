import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/utils/constants/sizes.dart';

import '../../../../utils/constants/color.dart';
import '../../../../utils/helpers/helper_functions.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const VAppBar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(VSizes.borderRadiusMd),
                      ),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(VSizes.borderRadiusMd),
                      ),

                    ),
                    prefixIcon: Icon(
                      Iconsax.user,
                      color: dark ? VColors.secondary : VColors.primary,
                    ),
                    labelText: 'Name',
                  ),
                ),

                const SizedBox(
                  height: VSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(VSizes.borderRadiusMd)),
                      ),
                      prefixIcon: Icon(
                        Iconsax.mobile,
                        color: dark ? VColors.secondary : VColors.primary,
                      ),
                      labelText: 'Contact'),
                ),
                const SizedBox(
                  height: VSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(VSizes.borderRadiusMd)),
                            ),
                            prefixIcon: Icon(
                              Iconsax.building,
                              color: dark ? VColors.secondary : VColors.primary,
                            ),
                            labelText: 'Street'),
                      ),
                    ),
                    const SizedBox(
                      width: VSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(VSizes.borderRadiusMd)),
                            ),
                            prefixIcon: Icon(
                              Iconsax.code,
                              color: dark ? VColors.secondary : VColors.primary,
                            ),
                            labelText: 'Postal Code'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: VSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(VSizes.borderRadiusMd)),
                            ),
                            prefixIcon: Icon(
                              Iconsax.building_4,
                              color: dark ? VColors.secondary : VColors.primary,
                            ),
                            labelText: 'City'),
                      ),
                    ),
                    const SizedBox(
                      width: VSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(VSizes.borderRadiusMd)),
                            ),
                            prefixIcon: Icon(
                              Iconsax.activity,
                              color: dark ? VColors.secondary : VColors.primary,
                            ),
                            labelText: 'State'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: VSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(VSizes.borderRadiusMd)),
                      ),
                      prefixIcon: Icon(
                        Iconsax.global,
                        color: dark ? VColors.secondary : VColors.primary,
                      ),
                      labelText: 'Country'),
                ),
                const SizedBox(
                  height: VSizes.defaultSpace,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          dark ? VColors.secondary : VColors.primary,
                      foregroundColor: VColors.light,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(VSizes.borderRadiusMd)),
                    ),
                    child: const Text('Save'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
