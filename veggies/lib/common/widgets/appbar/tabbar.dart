import 'package:flutter/material.dart';
import 'package:veggies/utils/device/device_utility.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';

import '../../../utils/constants/color.dart';

class VTabBar extends StatelessWidget implements PreferredSizeWidget{
  const VTabBar({super.key, required this.tabs});
final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Material(
color: dark?VColors.dark:VColors.light,
      child: TabBar(
tabs: tabs,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: VColors.primary,
        labelColor: dark ? VColors.light:VColors.primary,
        unselectedLabelColor: VColors.darkgrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(VDeviceUtils.getAppBarHeight());
}
