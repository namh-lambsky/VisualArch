import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class CustomSeparator extends StatelessWidget {
  const CustomSeparator({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: titleBigStyleLight,
        ),
        const Divider(
          color: Colors.white,
          thickness: 1,
          height: 10,
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
