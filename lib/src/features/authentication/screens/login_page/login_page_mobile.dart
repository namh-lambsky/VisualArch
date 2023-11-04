import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/constants/colors.dart';

import 'login_form/login_form.dart';
import 'login_header/login_header.dart';

class LoginPageMobile extends StatelessWidget {
  const LoginPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding = context.layout.value(xs: 8,sm: 10);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding * 4),
              child: const SafeArea(
                  child: Column(
                    children: [
                      LoginHeader(),
                      SizedBox(height: 20,),
                      LoginForm(),
                    ],
                  ),
                ),
              )),
    );
  }
}
