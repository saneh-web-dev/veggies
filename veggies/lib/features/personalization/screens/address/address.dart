import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/features/personalization/screens/address/widgets/single_address.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import 'add_new_address.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(() => const AddNewAddressScreen()),
          backgroundColor: VColors.primary,
          child: const Icon(
            Iconsax.add,
            color: VColors.light,
          ),
        ),
        appBar: VAppBar(
            showBackArrow: true,
            title: Text('Addresses',
                style: Theme.of(context).textTheme.headlineSmall)),
        body: const SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(VSizes.defaultSpace),
                child: Column(children: [
                  VSingleAddress(selectedAddress: false),
                  VSingleAddress(selectedAddress: true),
                ]))));
  }
}
