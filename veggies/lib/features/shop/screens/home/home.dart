import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/layouts/grid_layout.dart';
import 'package:veggies/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:veggies/common/widgets/shimmers/shimmer_loader.dart';
import 'package:veggies/features/shop/screens/all_products/all_products.dart';
import 'package:veggies/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:veggies/features/shop/screens/home/widgets/home_categories.dart';
import 'package:veggies/features/shop/screens/home/widgets/promo_slider.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VPrimaryHeaderContainer(
                child: Column(
                  children: [
                    ////app bar
                    VHomeAppBar(),

                    SizedBox(
                      height: VSizes.spaceBtwSections,
                    ),
                    // search bar
                    VSearchContainer(
                      text: 'search in store',
                      icon: Iconsax.search_normal_1_copy,
                    ),

                    SizedBox(
                      height: VSizes.spaceBtwSections,
                    ),

                    // heading
                    Padding(
                      padding: EdgeInsets.only(left: VSizes.defaultSpace),
                      child: Column(
                        children: [
                          VSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            textColor: VColors.light,
                          ),
                          SizedBox(
                            height: VSizes.spaceBtwItems,
                          ),

                          //category
                          VHomeCategories(),
                          SizedBox(
                            height: VSizes.spaceBtwItems + 20,
                          ),

                        ],
                      ),
                    )
                  ],
                )),

            //body
            Padding(
                padding: const EdgeInsets.all(VSizes.defaultSpace),
                child: Column(children: [
                  const VPromoSlider(),

                  // heading
                  VSectionHeading(title: 'Popular Products',
                    onPressed: () =>
                        Get.to(() =>  AllProducts(
                          title: 'Popular Products',
                          query:FirebaseFirestore.instance.collection('Products').where('IsFeatured',isEqualTo:true,).limit(6),
                          futureMethod: controller.fetchAllFeaturedProducts(),
                        )),),

                  const SizedBox(
                    height: VSizes.spaceBtwSections,
                  ),

                  // products
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const VShimmerEffect(width: 55, height: 55);
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(child: Text('No Data Found!', style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,),);
                    }
                    return VGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) =>
                            VProductCartVertical(product: controller
                                .featuredProducts[index]));
                  })
                ]))
          ],
        ),
      ),
    );
  }
}
