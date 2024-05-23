import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class VSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: VSizes.appBarHeight,
    left: VSizes.defaultSpace,
    right: VSizes.defaultSpace,
    bottom: VSizes.defaultSpace,
  );
}
