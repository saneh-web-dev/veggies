import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/common/widgets/icons/v_circular_icon.dart';
import 'package:veggies/common/widgets/layouts/grid_layout.dart';
import 'package:veggies/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:veggies/features/shop/models/product_model.dart';
import 'package:veggies/features/shop/screens/home/home.dart';

import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          VCircularIcon(
            icon: Iconsax.add,
            color: VColors.primary,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              VGridLayout(itemCount: 4, itemBuilder: (_,index)=> VProductCartVertical(product: ProductModel.empty(),))
            ],
          ),
        ),
      ),
    );
  }
}
