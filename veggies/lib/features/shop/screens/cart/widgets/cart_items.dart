import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class VCartItems extends StatelessWidget {
  const VCartItems({super.key,  this.showAddRemoveButton = true});

  final bool showAddRemoveButton;


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: VSizes.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) =>  const Column(
        children: [
          VCartItem(),
          SizedBox(
            height: VSizes.spaceBtwItems,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //add remove button
              Row(children: [
                SizedBox(
                  width: 70,
                ),
                VProductQuantityWithAddOrRemove(),
              ]),
              VProductPriceText(price: '20/kg')
            ],
          )
        ],
      ),
    );
  }
}
