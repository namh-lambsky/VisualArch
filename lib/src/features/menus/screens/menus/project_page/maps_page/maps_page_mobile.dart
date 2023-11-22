import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/common_widgets/appbar/custom_appbar.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:visualarch_v1/src/features/menus/screens/menus/project_page/maps_impl/maps_widget.dart';

class MapsPageMobile extends StatelessWidget {
  final String projectAddress;

  const MapsPageMobile({
    required this.projectAddress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(hasBackButton: true, showProfilePhoto: false),
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              "Mapa",
              style: titleStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: context.layout.height * 0.8,
              child: MapsWidget(projectAddress: projectAddress),
            )
          ],
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
