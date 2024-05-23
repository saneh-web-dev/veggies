// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:veggies/utils/theme/custom_themes/text_theme.dart';

import 'package:veggies/utils/theme/custom_themes/appbar_theme.dart';
import 'package:veggies/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:veggies/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:veggies/utils/theme/custom_themes/chip_theme.dart';
import 'package:veggies/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:veggies/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:veggies/utils/theme/custom_themes/text_field_theme.dart';
class VeggiesTheme {
  VeggiesTheme._(); //private function

  static  ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    textTheme: VTextTheme.lightTextTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.black,
    textTheme: VTextTheme.darkTextTheme,
  );
}
