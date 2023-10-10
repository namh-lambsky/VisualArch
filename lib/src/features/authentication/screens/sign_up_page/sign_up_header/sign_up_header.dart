import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visualarch_v1/src/common_widgets/header/custom_header.dart';

import '../../../../../constants/images_strings.dart';
import '../../../../../constants/styles.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      image: SvgPicture.asset(
        signUpImage,
        width: 150,
        height: 150,
      ),
      title: "Eres nuevo aqui?",
      subtitle: "Registra tus datos para acceder al contenido!",
    );
  }
}
