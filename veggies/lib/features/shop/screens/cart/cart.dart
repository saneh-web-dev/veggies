import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:veggies/features/shop/screens/checkout/checkout.dart';
import 'package:veggies/utils/constants/sizes.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/color.dart';

class VCartScreen extends StatelessWidget {
  const VCartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: VAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(VSizes.defaultSpace),
          child:VCartItems(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: ()=>Get.to(()=>const VCheckoutScreen()),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(VSizes.borderRadiusMd),
              ),
              backgroundColor: dark ? VColors.secondary : VColors.primary,
              foregroundColor: VColors.light),
          child: const Text('Checkout 200Rs'),
        ),
      ),
    );
  }
}
