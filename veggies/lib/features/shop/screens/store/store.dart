import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:veggies/common/widgets/products/cart/cart_menu_icon.dart';
// import 'package:veggies/common/widgets/texts/section_heading.dart';
import 'package:veggies/features/shop/controllers/category_controller.dart';
// import 'package:veggies/features/shop/screens/brands/all_brands.dart';
import 'package:veggies/features/shop/screens/store/widgets/category_tab.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
// import '../../../../common/widgets/brands/brands_card.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: VAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [VCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: dark ? VColors.dark : VColors.light,
                  expandedHeight: 400,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(VSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        SizedBox(height: VSizes.spaceBtwItems),
                        VSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          icon: Iconsax.search_normal_1_copy,
                          showBackgroundColor: false,
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(height: VSizes.spaceBtwSections),
                        //Features Brands
                        // VSectionHeading(
                        //   title: 'Features Brands',
                        //   onPressed: () =>
                        //       Get.to(() => const AllBrandsScreens()),
                        // ),
                        // const SizedBox(height: VSizes.spaceBtwItems / 1.5),
                        //
                        // const VBrandCard(
                        //   showBorder: true,
                        //   title: 'Meri Sabji',
                        // ),
                      ],
                    ),
                  ),
                  bottom: VTabBar(
                    tabs: categories
                        .map((category) => Tab(
                              child: Text(category.name),
                            ))
                        .toList(),
                  ))
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => VCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
