import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/styles.dart';

class CustomDialog extends StatelessWidget {
  String title;
  String message;
  IconData iconData;
  bool hasButtons;
  Color iconColor;
  VoidCallback nextCallback;
  String btText;

  CustomDialog(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.nextCallback,
      required this.message,
      this.hasButtons = false,
      this.btText = "Ok",
      this.iconColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        backgroundColor: modalBackgroundColor,
        icon: Icon(iconData),
        iconColor: iconColor,
        title: Text(
          title,
          style: titleStyle,
        ),
        content: Text(
          message,
          style: extraLightStyle,
        ),
        actions: hasButtons
            ? <Widget>[
                ElevatedButton(
                  onPressed: nextCallback,
                  style: primaryButton,
                  child: Text(
                    btText,
                    style: extraLightStyle,
                  ),
                )
              ]
            : <Widget>[
                ElevatedButton(
                  onPressed: nextCallback,
                  style: primaryButton,
                  child: Text(
                    btText,
                    style: extraLightStyle,
                  ),
                )
              ],
      ),
    );
  }
}
