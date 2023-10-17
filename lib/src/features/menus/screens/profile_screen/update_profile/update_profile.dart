import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/features/menus/screens/profile_screen/update_profile/update_profile_desktop.dart';
import 'package:visualarch_v1/src/features/menus/screens/profile_screen/update_profile/update_profile_mobile.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.breakpoint > LayoutBreakpoint.sm) {
      return const UpdateProfileDesktop();
    } else {
      return const UpdateProfileMobile();
    }
  }
}
