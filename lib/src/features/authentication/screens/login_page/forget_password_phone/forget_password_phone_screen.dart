import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/common_widgets/button/custom_elevated_button.dart';
import 'package:visualarch_v1/src/common_widgets/header/custom_header.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/images_strings.dart';
import '../../../../../constants/styles.dart';
import '../../sign_up_page/forget_password_otp/otp_screen.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding = context.layout.value(xs: 8);
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          padding: EdgeInsets.all(padding * 4),
          child: Column(
            children: [
              const SizedBox(height: 80,),
              CustomHeader(
                  image: SvgPicture.asset(
                    forgetPasswordImage,
                    height: 220,
                    width: 220,
                  ),
                  title: "Recupera tu cuenta!",
                  subtitle:
                      "Escribe el número telefónico que usaste para crear tu cuenta:"),
              const SizedBox(
                height: 30,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: textFieldEmailDecoration,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomElevatedButton(
                    btText: "Siguiente",
                    onPressed: () {Get.to(()=>const OtpScreen());},
                    btStyle: primaryButton,
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
