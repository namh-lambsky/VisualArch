import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/features/menus/models/building_company_model.dart';
import 'package:visualarch_v1/src/features/menus/screens/main_menu/builder_page/builder_page_desktop.dart';
import 'package:visualarch_v1/src/features/menus/screens/main_menu/builder_page/builder_page_mobile.dart';

class BuilderPage extends StatelessWidget {
  final String builderName;

  const BuilderPage({
    Key? key,
    required this.builderName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.breakpoint > LayoutBreakpoint.sm) {
      return BuilderPageDesktop(
        builderName: builderName,
      );
    } else {
      return BuilderPageMobile(
        builderName: builderName,
      );
    }
  }
}
