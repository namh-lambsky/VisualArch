import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/features/authentication/screens/landing_page/landing_page_desktop.dart';
import 'package:visualarch_v1/src/features/authentication/screens/landing_page/landing_page_mobile.dart';
import 'package:visualarch_v1/src/features/menus/screens/main_menu/main_menu_desktop.dart';
import 'package:visualarch_v1/src/features/menus/screens/main_menu/main_menu_mobile.dart';


class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(context.breakpoint>LayoutBreakpoint.sm){
      return const MainMenuDesktop();
    }
    else{
      return const MainMenuMobile();
    }

  }
}
