import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:veggies/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:veggies/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:veggies/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:veggies/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:veggies/navigation_menu.dart';
import 'package:veggies/utils/constants/color.dart';
import 'package:veggies/utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class VCheckoutScreen extends StatelessWidget {
  const VCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: VAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              //items in cart
              const VCartItems(
                showAddRemoveButton: true,
              ),
              const SizedBox(
                height: VSizes.spaceBtwSections,
              ),

              //coupon TextField
              const VCouponCode(),
              const SizedBox(
                height: VSizes.spaceBtwSections,
              ),
              //Billing Section
              VRoundedContainer(
                showBorder: true,
                backgroundColor: dark ? VColors.dark : VColors.light,
                padding: const EdgeInsets.all(VSizes.md),
                child: const Column(
                  children: [
                    //pricing
                    VBillingAmountSection(),
                    SizedBox(
                      height: VSizes.spaceBtwItems,
                    ),
                    //Divider
                    Divider(),
                    SizedBox(
                      height: VSizes.spaceBtwItems,
                    ),

                    //Payments Method
                    VBillingPaymentSection(),
                    //Address
                    VBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                image: VImages.successGif,
                title: 'Payment Successful',
                subTitle: 'Your Item will be delivered soon',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
              )),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(VSizes.borderRadiusMd),
              ),
              backgroundColor: dark ? VColors.secondary : VColors.primary,
              foregroundColor: VColors.light,
          ),
          child: const Text('Checkout 200Rs'),
        ),
      ),
    );
  }
}
