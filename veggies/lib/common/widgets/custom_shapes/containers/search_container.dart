import 'package:flutter/material.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
// import '../../../../utils/helpers/helper_functions.dart';

class VSearchContainer extends StatelessWidget {
  const VSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackgroundColor = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackgroundColor, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    // final dark = VHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: VDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(VSizes.md),
        decoration: BoxDecoration(
          // color: showBackgroundColor
          //     ? dark
          //     ? VColors.dark
          //     : VColors.light
          //     : Colors.transparent,
          color: Colors.white70,
          borderRadius: BorderRadius.circular(VSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: VColors.light) : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: VColors.darkergrey),
            const SizedBox(
              width: VSizes.spaceBtwItems,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: VColors.grey),
            )
          ],
        ),
      ),
    );
  }
}
