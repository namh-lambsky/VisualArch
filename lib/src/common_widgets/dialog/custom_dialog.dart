import 'package:flutter/material.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/styles.dart';

class CustomDialog extends StatelessWidget {
  final bool value;
  final String message;

  const CustomDialog({Key? key, required this.value, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: value
          ? const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
            )
          : const Icon(
              Icons.cancel_outlined,
              color: Colors.red,
            ),
      content: Text(message,style: subtitleStyleS,textAlign: TextAlign.center),
      backgroundColor: modalBackgroundColor,
    );
  }
}
