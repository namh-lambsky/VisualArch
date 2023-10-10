import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/common_widgets/button/custom_elevated_button.dart';
import 'package:visualarch_v1/src/common_widgets/header/custom_header.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/images_strings.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:visualarch_v1/src/features/authentication/screens/landing_page/landing_page.dart';

class VerifyEmailMobile extends StatelessWidget {
  const VerifyEmailMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding = context.layout.value(xs: 8);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(() => const LandingPage());
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              CustomHeader(
                image: SvgPicture.asset(verifyImage),
                title: "Verifica tu correo!",
                subtitle:
                    "Pronto llegará un link de verificación al correo, por favor revisa tu correo y has click en el link enviado para verificar el correo.\n si no se te redirige automaticamente tras verificar tu correo, haz click en el boton continuar.",
              ),
              const SizedBox(height: 30,),
              CustomElevatedButton(btText: "Continuar", onPressed: (){}, btStyle: primaryButton)

            ],
          ),
        ),
      ),
    );
  }
}
