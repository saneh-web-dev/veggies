import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:veggies/features/personalization/controllers/user_controller.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/shimmers/shimmer_loader.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../cart/cart.dart';

class VHomeAppBar extends StatelessWidget {
  const VHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return VAppBar(
      title: Column(
        children: [
          Text(
            VTexts.homeAppBarTitle,
            style: Theme
                .of(context)
                .textTheme
                .labelMedium!
                .apply(color: VColors.light),
          ),
          Obx(() {
            if(controller.profileLoading.value){
              return const VShimmerEffect(width:80,height:15);
            }
            else{
              return Text(
                controller.user.value.fullName,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: VColors.light),
              );
            }
          }
          ),
        ],
      ),
      actions: [
        VCartCounterIcon(
          onPressed: () => Get.to(() => const VCartScreen()),
          iconColor: VColors.light,
        )
      ],
    );
  }
}
