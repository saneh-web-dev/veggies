import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnName;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callBack;

  const RoundedButton(
      {super.key, required this.btnName,
      this.icon,
      this.bgColor,
      this.textStyle,
      this.callBack,
      required String buttonText});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          callBack!();
        },
        child: const Row());
  }
}
