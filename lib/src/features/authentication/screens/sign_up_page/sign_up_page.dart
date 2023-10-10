import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/features/authentication/screens/sign_up_page/sign_up_desktop.dart';
import 'package:visualarch_v1/src/features/authentication/screens/sign_up_page/sign_up_mobile.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(context.breakpoint>LayoutBreakpoint.sm){
      return const SignUpPageDesktop();
    }
    else{
      return const SignUpPageMobile();
    }
  }
}
