import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/constants/other_constants.dart';
import 'package:visualarch_v1/src/features/authentication/screens/sign_up_page/sign_up_page.dart';


import '../../../../common_widgets/button/custom_elevated_button.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/images_strings.dart';
import '../../../../constants/styles.dart';
import '../login_page/login_page.dart';


class LandingPageMobile extends StatelessWidget {
  const LandingPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double padding=context.layout.value(xs: 8);

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                SvgPicture.asset(
                  logo,
                  semanticsLabel: 'Logo VisualArch',
                  height: 350,
                  width: 350,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding*4),
                  child: const Text(
                    "Plataforma líder en tecnología inmobiliaria que ofrece una amplia colección de paquetes como herramienta de ayuda a las inmobiliarias a visualizar sus propiedades de manera virtual",
                    style: paragraphStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButton(btText: "Registrarse",
                  onPressed: () {
                    Get.to(() => const SignUpPage(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 700));
                  },
                  btStyle: primaryButton,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "Ya tienes una cuenta?",
                    style: paragraphStyle,
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                CustomElevatedButton(btText: "Iniciar Sesión", onPressed: () {
                  Get.to(() => const LoginPage(),transition: Transition.leftToRightWithFade,duration: defaultTransitionD);
                }, btStyle: primaryButton),
              ],
            ),
          ),
        ),);
  }
}
