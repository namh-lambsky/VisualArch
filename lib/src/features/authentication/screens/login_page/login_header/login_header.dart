import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visualarch_v1/src/common_widgets/header/custom_header.dart';

import '../../../../../constants/images_strings.dart';
import '../../../../../constants/styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      image: SvgPicture.asset(
        loginImage,
        width: 280,
        height: 280,
      ),
      title: "Bienvenido de vuelta",
      subtitle: "Inicia Sesión para continuar",
    );
  }
}
