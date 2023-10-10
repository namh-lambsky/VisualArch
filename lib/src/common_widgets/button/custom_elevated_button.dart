import 'package:flutter/material.dart';

import '../../constants/styles.dart';


class CustomElevatedButton extends StatelessWidget {
  final String btText;
  final ButtonStyle btStyle;
  Function()? onPressed;

  CustomElevatedButton(
      {super.key, required this.btText, required this.onPressed, required this.btStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: btStyle, onPressed: onPressed,
        child: Text(btText, style: buttonTextStyle,));
  }
}
