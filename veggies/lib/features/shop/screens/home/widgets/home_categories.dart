import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/common/widgets/shimmers/category_shimmer.dart';
import 'package:veggies/features/shop/controllers/category_controller.dart';
import 'package:veggies/features/shop/screens/sub_category/sub_category.dart';
import '../../../../../common/widgets/image_texts/vertical_image_text.dart';

class VHomeCategories extends StatelessWidget {
  const VHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return const VCategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
          height: 80,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categoryController.featuredCategories[index];
                return VVerticalImageText(
                  image: category.image,
                  title: 'logo',
                  onTap: () => Get.to(() => const SubCategoryScreen()),
                );
              }));
    });
  }
}
