import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/features/authentication/screens/landing_page/landing_page_desktop.dart';
import 'package:visualarch_v1/src/features/authentication/screens/landing_page/landing_page_mobile.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(context.breakpoint>LayoutBreakpoint.sm){
      return const LandingPageDesktop();
    }
    else{
      return const LandingPageMobile();
    }

  }
}
