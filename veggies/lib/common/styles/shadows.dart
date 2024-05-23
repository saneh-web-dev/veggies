import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';

class VShadowStyle{
  static final verticalProductShadow = BoxShadow(
    color: VColors.darkergrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: VColors.darkergrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );


}