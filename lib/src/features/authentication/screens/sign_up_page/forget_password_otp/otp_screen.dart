import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/common_widgets/button/custom_elevated_button.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/images_strings.dart';
import 'package:visualarch_v1/src/constants/styles.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding = context.layout.value(xs: 8);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.all(padding * 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: SvgPicture.asset(
              otpImage,
              width: 250,
              height: 250,
            )),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Código OTP",
              style: titleStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Ingrese el código de verificación enviado a " +
                  "zapado@gmail.com",
              style: subtitleStyleS,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            OtpTextField(
              numberOfFields: 6,
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              onSubmit: (code){
                print("OTP code: $code");
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomElevatedButton(btText: "Siguiente", onPressed: (){

            }, btStyle: primaryButton)
          ],
        ),
      ),
    );
  }
}
