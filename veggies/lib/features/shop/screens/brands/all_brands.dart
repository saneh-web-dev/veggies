import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/common/widgets/brands/brands_card.dart';
import 'package:veggies/common/widgets/layouts/grid_layout.dart';
import 'package:veggies/common/widgets/texts/section_heading.dart';
import 'package:veggies/features/shop/screens/brands/brands_product.dart';
import 'package:veggies/utils/constants/sizes.dart';

class AllBrandsScreens extends StatelessWidget {
  const AllBrandsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              //Heading
              const VSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),

              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),

              //brands
              VGridLayout(
                  itemCount: 5,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) =>
                      VBrandCard(
                        showBorder: true,
                        onTap: ()=>Get.to(()=>const BrandProducts()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
