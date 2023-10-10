import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/features/authentication/screens/login_page/login_page_desktop.dart';
import 'package:visualarch_v1/src/features/authentication/screens/login_page/login_page_mobile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(context.breakpoint>LayoutBreakpoint.sm){
      return const LoginPageDesktop();
    }
    else{
      return const LoginPageMobile();
    }
  }
}
