import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/common/widgets/shimmers/shimmer_loader.dart';
import 'package:veggies/features/shop/controllers/banner_controller.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/v_rounded_images.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/sizes.dart';

class VPromoSlider extends StatelessWidget {
  const VPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
        () {
//loader
        if(controller.isLoading.value) return const VShimmerEffect(width: double.infinity, height: 190);

        if(controller.banners.isEmpty){
        return const Center(child: Text('No Data Found'),);
        }else{
          return Column(
            children: [
              CarouselSlider(
                items: controller.banners
                    .map((banner) => VRoundedImage(
                  imageUrl: banner.imageUrl,
                  isNetworkImage: true,
                  border: Border.all(color: Colors.green, width: 3),
                  onPressed: () => Get.toNamed(banner.targetScreen),
                ))
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) => controller.updatePageIndicator(index),
                ),
              ),
              const SizedBox(
                height: VSizes.spaceBtwItems,
              ),
              Obx(() => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    VCircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor: controller.carouselCurrentIndex.value == i
                          ? VColors.primary
                          : VColors.grey,
                    ),
                  const SizedBox(height: VSizes.spaceBtwItems),
                ],
              ))
            ],
          );
        }
        }
    );
  }
}
