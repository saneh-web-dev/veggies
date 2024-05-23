import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/common/widgets/shimmers/shimmer_loader.dart';
import 'package:veggies/features/shop/controllers/all_product_controller.dart';
import 'package:veggies/utils/constants/sizes.dart';
import 'package:veggies/utils/helpers/cloud_helper_function.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../models/product_model.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    return Scaffold(
      appBar: const VAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                const loader = VShimmerEffect(width: 80, height: 80);

                final widget = VCloudHelperFunction.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);

                if (widget != null) {
                  return widget;
                }
                final products = snapshot.data!;

                return VSortableProducts(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
