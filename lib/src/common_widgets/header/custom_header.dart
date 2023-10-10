import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class CustomHeader extends StatelessWidget {
  final Widget image;
  final String title;
  final String subtitle;
  final TextAlign? textAlign;

  const CustomHeader(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Center(
          child: image,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          title,
          style: titleStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          subtitle,
          style: subtitleStyle,
        ),
      ],
    );
  }
}
