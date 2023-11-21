import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/features/menus/screens/main_menu/project_page/project_page_desktop.dart';
import 'package:visualarch_v1/src/features/menus/screens/main_menu/project_page/project_page_mobile.dart';

class ProjectPage extends StatelessWidget {
  final String projectName;
  const ProjectPage({Key? key, required this.projectName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(context.breakpoint>LayoutBreakpoint.sm){
      return const ProjectPageDesktop();
    }else{
      return ProjectPageMobile(projectName: projectName,);
    }
  }
}
