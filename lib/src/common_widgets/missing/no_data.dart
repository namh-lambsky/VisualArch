import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visualarch_v1/src/common_widgets/appbar/custom_appbar.dart';
import 'package:visualarch_v1/src/constants/images_strings.dart';
import 'package:visualarch_v1/src/constants/styles.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Lo sentimos. \nNo hay datos.",
          style: titleBigStyleLight,
        ),
        const SizedBox(
          height: 35,
        ),
        SvgPicture.asset(
          noData,
          height: 300,
          width: 300,
        ),
      ],
    );
  }
}
