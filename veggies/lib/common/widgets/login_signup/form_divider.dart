import 'package:flutter/material.dart';
import 'package:veggies/utils/helpers/helper_functions.dart';
import '../../../utils/constants/color.dart';


class VFormDivider extends StatelessWidget {
  const VFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark?VColors.darkgrey:VColors.grey,
            thickness:0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(dividerText,style: Theme.of(context).textTheme.labelMedium,),
        Flexible(
          child: Divider(
            color: dark?VColors.darkgrey:VColors.grey,
            thickness:0.5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}