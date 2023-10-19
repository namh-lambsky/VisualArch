import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/common_widgets/button/custom_elevated_button.dart';
import 'package:visualarch_v1/src/common_widgets/header/custom_header.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/images_strings.dart';
import 'package:visualarch_v1/src/features/authentication/controllers/authentication_controller.dart';

import '../../../../../../common_widgets/dialog/custom_dialog.dart';
import '../../../../../../constants/styles.dart';

class ForgetPasswordMailScreen extends StatefulWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordMailScreen> createState() =>
      _ForgetPasswordMailScreenState();
}

class _ForgetPasswordMailScreenState extends State<ForgetPasswordMailScreen> {
  @override
  Widget build(BuildContext context) {
    double padding = context.layout.value(xs: 8);
    final controller = Get.put(AuthenticationController());

    return Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
            padding: EdgeInsets.all(padding * 4),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  CustomHeader(
                      image: SvgPicture.asset(
                        forgetPasswordImage,
                        height: 220,
                        width: 220,
                      ),
                      title: "Recupera tu cuenta!",
                      subtitle:
                          "Escribe el correo electronico que usaste para crear tu cuenta:"),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        controller: controller.email,
                        decoration: textFieldEmailDecoration,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomElevatedButton(
                        btText: "Siguiente",
                        onPressed: () {
                          Map<String, dynamic> values;
                          AuthenticationController.instance
                              .resetPasswordByEmail(controller.email.text);
                        },
                        btStyle: primaryButton,
                      )
                    ],
                  ))
                ],
              ),
            )));
  }
}
