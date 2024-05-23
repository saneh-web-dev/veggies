import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:veggies/common/widgets/texts/brand_title_text.dart';
import 'package:veggies/utils/constants/enums.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/sizes.dart';

class VBrandTitleWithVerifiedIcon extends StatelessWidget {
  const VBrandTitleWithVerifiedIcon(
      {super.key,
      required this.title,
       this.maxLines = 1,
      this.textColor,
      this.iconColor = VColors.primary,
      this.textAlign = TextAlign.center,
       this.brandTextSizes = TextSizes.large
      });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
        child:VBrandTitleText (
        title:title,
      color:textColor,
      maxLines: maxLines,
      textAlign: textAlign,
      brandTextSizes: brandTextSizes,
    )
        ),
        const SizedBox(width: VSizes.xs,),
        Icon(Iconsax.verify, color: iconColor,size: VSizes.iconSm,)
        ],
    );
  }
}
