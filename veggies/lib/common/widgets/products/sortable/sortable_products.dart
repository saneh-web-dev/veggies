import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/features/shop/controllers/all_product_controller.dart';
import 'package:veggies/features/shop/models/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_card/product_card_vertical.dart';

class VSortableProducts extends StatelessWidget {
  const VSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      //dropdown
      children: [
        DropdownButtonFormField(
          items: const [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Best Selling'
          ]
              .map((options) => DropdownMenuItem(
            value: options,
            child:  Text(options),
          ))
              .toList(),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort_copy),
              border: OutlineInputBorder(
              )),
        ),
        const SizedBox(height: VSizes.spaceBtwSections,),
        //Products
        Obx(()=> VGridLayout(itemCount: controller.products.length, itemBuilder: (_,index)=> VProductCartVertical(product:controller.products[index],)))
      ],
    );
  }
}
