import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/common_widgets/user_image/user_image_register.dart';
import 'package:visualarch_v1/src/features/authentication/screens/sign_up_page/sign_up_form/sign_up_form.dart';
import 'package:visualarch_v1/src/features/authentication/screens/sign_up_page/sign_up_header/sign_up_header.dart';

import '../../../../constants/colors.dart';

class SignUpPageMobile extends StatelessWidget {
  const SignUpPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding = context.layout.value(xs: 8, sm: 10);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding * 4),
        child: SafeArea(
          child: Column(
            children: [
              const SignUpHeader(),
              const SizedBox(
                height: 20,
              ),
              UserImageRegister(isCustomizable: true),
              const SizedBox(
                height: 20,
              ),
              const SignUpForm(),
            ],
          ),
        ),
      )),
    );
  }
}
