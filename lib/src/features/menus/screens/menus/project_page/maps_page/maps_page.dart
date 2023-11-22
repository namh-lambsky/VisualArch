import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/features/menus/screens/menus/project_page/maps_page/maps_page_desktop.dart';
import 'package:visualarch_v1/src/features/menus/screens/menus/project_page/maps_page/maps_page_mobile.dart';

class MapsPage extends StatelessWidget {
  final String projectAddress;

  const MapsPage({
    required this.projectAddress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.breakpoint > LayoutBreakpoint.sm) {
      return const MapsPageDesktop();
    } else {
      return MapsPageMobile(projectAddress:projectAddress);
    }
  }
}
