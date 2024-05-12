import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visualarch_v1/src/common_widgets/appbar/custom_appbar.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/images_strings.dart';
import 'package:visualarch_v1/src/constants/styles.dart';

class OnDevelopment extends StatelessWidget {
  const OnDevelopment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(hasBackButton: true,showProfilePhoto: false),
      body: Column(
        children: [
          const Text(
            "Lo sentimos. \nAún estamos trabando en ello :)",
            style: titleBigStyleLight,
            textAlign: TextAlign.center,
          ),
          SvgPicture.asset(
            onProgress,
          ),
        ],
      ),
      backgroundColor: backgroundColor,
    );
  }
}
