import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/features/shop/screens/cart/cart.dart';

import '../../../../utils/constants/color.dart';


class VCartCounterIcon extends StatelessWidget {
  const VCartCounterIcon({
    super.key, required this.onPressed,  this.iconColor ,
  });
  final VoidCallback onPressed;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          IconButton(onPressed: ()=>Get.to(()=>const VCartScreen()), icon: Icon(Iconsax.shopping_bag,color: iconColor,),),
          Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: VColors.dark.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child:  Center(
                  child:  Text('2',style: Theme.of(context).textTheme.labelLarge!.apply(color: VColors.light,fontSizeFactor: 0.8),)
              ),
            ),
          )
        ]
    );
  }
}