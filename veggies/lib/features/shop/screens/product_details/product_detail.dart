import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:veggies/common/widgets/icons/v_circular_icon.dart';
import 'package:veggies/common/widgets/texts/section_heading.dart';
import 'package:veggies/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:veggies/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:veggies/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:veggies/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:veggies/features/shop/screens/product_review/product_review.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const VBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          //Product image
          children: [
            VCurvedEdgeWidget(
              child: Container(
                color:
                    dark ? VColors.primary.withOpacity(0.8) : VColors.secondary,
                child: const Stack(
                  children: [
                    SizedBox(
                      height: 300,
                      child: Padding(
                        padding: EdgeInsets.all(VSizes.lg * 2),
                        child: Image(
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                          image: AssetImage(
                            VImages.avocado,
                          ),
                          width: double.infinity,
                        ),
                      ),
                    ),

                    // appbar
                    VAppBar(
                      showBackArrow: true,
                      actions: [
                        VCircularIcon(
                          icon: Iconsax.heart,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            //Product details
            Padding(
              padding: const EdgeInsets.only(
                right: VSizes.defaultSpace,
                left: VSizes.defaultSpace,
                bottom: VSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  //Rating and shares
                  const VRatingAndShare(),

                  // price ,title,stock,and brands
                  VProductMetaData(product: product),
                  //Attributes
                  const VProductAttribute(),
                  const SizedBox(
                    height: VSizes.spaceBtwSections,
                  ),
                  //checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              dark ? VColors.primary : VColors.secondary),
                          foregroundColor:
                              const MaterialStatePropertyAll(VColors.light),
                          shape: const MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          VSizes.borderRadiusMd))))),
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(
                    height: VSizes.spaceBtwSections,
                  ),
                  //Description
                  const VSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: VSizes.spaceBtwItems,
                  ),
                   ReadMoreText(
product.description??'',
                    trimLines: 2,
                    trimMode: TrimMode.Length,
                    trimCollapsedText: ' Read More ',
                    moreStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    trimExpandedText: ' ...Read Less ',
                    lessStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  //Reviews
                  const Divider(),
                  const SizedBox(
                    height: VSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const VSectionHeading(
                        title: 'Review(199)',
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () => Get.to(() => const VProductReview()),
                          icon: const Icon(Iconsax.arrow_right_1_copy))
                    ],
                  ),
                  const SizedBox(
                    height: VSizes.spaceBtwSections,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
