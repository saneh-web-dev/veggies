import 'package:flutter/material.dart';

import '../../../../../utils/constants/color.dart';
import '../../../../../utils/device/device_utility.dart';

class VRatingProgressIndicator extends StatelessWidget {
  const VRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            )),
        Expanded(
            flex: 11,
            child: SizedBox(
              width: VDeviceUtils.getScreenWidth(context) * 0.8,
              child: LinearProgressIndicator(
                value: value,
                minHeight: 11,
                backgroundColor: VColors.grey,
                borderRadius: BorderRadius.circular(7),
                valueColor:
                const AlwaysStoppedAnimation<Color>(VColors.primary),
              ),
            )),
      ],
    );
  }
}
