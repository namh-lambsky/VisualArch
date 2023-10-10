import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/styles.dart';

class ForgetPasswordOptionsButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon;
  final VoidCallback onTap;

  ForgetPasswordOptionsButton(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: titleStyle),
                Text(
                  subtitle,
                  style: paragraphStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
