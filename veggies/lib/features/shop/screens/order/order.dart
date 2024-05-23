import 'package:flutter/material.dart';
import 'package:veggies/common/widgets/appbar/appbar.dart';
import 'package:veggies/features/shop/screens/order/widget/order_list.dart';
import 'package:veggies/utils/constants/sizes.dart';

class VOrderScreen extends StatelessWidget {
  const VOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(
        title: Text('My Orders',style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(VSizes.defaultSpace),

        //orders
        child: VOrderListItems(),
      ),
    );
  }
}
