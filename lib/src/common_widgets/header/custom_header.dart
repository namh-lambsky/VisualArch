import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class CustomHeader extends StatelessWidget {
  final Widget image;
  final String title;
  final String subtitle;
  bool isCentered;

  CustomHeader({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.isCentered = false,
  });

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
        isCentered
            ? Center(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: titleStyle,
                    ),
                    Text(
                      subtitle,
                      style: subtitleStyle,
                    ),
                  ],
                ),
              )
            : Align(
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  children: [
                    Text(
                      title,
                      style: titleStyle,
                    ),
                    Text(
                      subtitle,
                      style: subtitleStyle,
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
