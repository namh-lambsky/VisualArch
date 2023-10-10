import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/features/authentication/screens/sign_up_page/verify_email/verify_email_desktop.dart';
import 'package:visualarch_v1/src/features/authentication/screens/sign_up_page/verify_email/verify_email_mobile.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(context.breakpoint>LayoutBreakpoint.sm){
      return const VerifyEmailDesktop();
    }
    else{
      return const VerifyEmailMobile();
    }
  }
}
