import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'main_menu_desktop.dart';
import 'main_menu_mobile.dart';


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
