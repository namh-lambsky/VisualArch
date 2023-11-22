import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'builder_page_desktop.dart';
import 'builder_page_mobile.dart';

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
