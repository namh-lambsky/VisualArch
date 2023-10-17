import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/features/menus/screens/profile_screen/profile_menu_desktop.dart';
import 'package:visualarch_v1/src/features/menus/screens/profile_screen/profile_menu_mobile.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(context.breakpoint>LayoutBreakpoint.sm){
      return const ProfileMenuDesktop();
    }
    else{
      return const ProfileMenuMobile();
    }

  }
}
