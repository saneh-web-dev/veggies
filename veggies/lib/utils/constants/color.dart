import 'package:flutter/material.dart';

class VColors {
  VColors._();

// App basic color
  static const Color primary = Colors.green;
  static const Color dark = Colors.black;
  static const Color light = Colors.white;
  static const Color transparent = Colors.transparent;
  static const Color secondary = Color.fromARGB(255, 139, 245, 142);
  static const Color accent = Color.fromARGB(255, 11, 104, 14);

  //text color
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.grey;
  static const Color textWhite = Colors.white;

  //background colors
  static const Color backgroundPrimary = Colors.white;
  static const Color backgroundSecondary = Colors.grey;
  static const Color backgroundBlack = Colors.black;

  // background contaier color
  static const Color lightContainer = Colors.white;
  static const Color darkContainer = Colors.black;

  // button colors
  static const Color buttonPrimary = Colors.green;
  static const Color buttonSecondary = Colors.grey;
  static const Color buttondisabled = Colors.white;

  // border color
  static const Color borderPrimary = Colors.grey;
  static const Color borderSecondary = Colors.white;

  //error colors
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color info = Colors.grey;

  // neutral shades
  static const Color black = Colors.red;
  static const Color darkgrey = Color.fromARGB(255, 92, 91, 91);
  static const Color darkergrey = Color.fromARGB(255, 59, 59, 59);
  static const Color grey = Colors.grey;

  //gradient colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, 0.707),
    colors: [
      Colors.green,
      Color.fromARGB(255, 17, 226, 24),
      Colors.white,
    ],
  );
}
