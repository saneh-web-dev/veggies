import 'package:flutter/material.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/common/widgets/brands/brands_card.dart';
import 'package:veggies/common/widgets/products/sortable/sortable_products.dart';
import 'package:veggies/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: VAppBar(
        title: Text('Vegetables'),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          children: [
            //brand detail
            VBrandCard(showBorder: true,),
            SizedBox(
              height: VSizes.spaceBtwSections,
            ),
            VSortableProducts(products: [],),
          ],
        ),
        ),
      ),
    );
  }
}
