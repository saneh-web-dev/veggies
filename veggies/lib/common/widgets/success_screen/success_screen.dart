import 'package:flutter/material.dart';
import 'package:veggies/common/styles/spacing_styles.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle,  this.onPressed});

  final String image,title,subTitle;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:VSpacingStyle.paddingWithAppBarHeight * 2,
            child: Column(
              children: [
                Image(
                  image:  AssetImage(image),
                  width: VHelperFunctions.screenWidth() * 0.9,
                ),
                const SizedBox(height: VSizes.defaultSpace / 2,),

                Text(
                 title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: VSizes.defaultSpace / 2,),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: VSizes.defaultSpace / 2,),

                SizedBox(
                  width: double.infinity,
                  child:TextButton(
                    onPressed: onPressed,
                    style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelLarge,
                      backgroundColor:dark?VColors.secondary:VColors.primary ,
                      foregroundColor: VColors.light,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(VSizes.borderRadiusMd),
                      ),
                    ),
                    child: const Text(VTexts.vContinue,style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
