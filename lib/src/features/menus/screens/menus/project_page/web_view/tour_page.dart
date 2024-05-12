import 'package:flutter/material.dart';
import 'package:visualarch_v1/src/common_widgets/appbar/custom_appbar.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/features/menus/screens/menus/project_page/web_view/web_view_container.dart';

class TourPage extends StatelessWidget {
  final String url;

  const TourPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const CustomAppbar(
        hasBackButton: true,
        showProfilePhoto: false,
      ),
      body: WebViewContainer(
        url: url,
      ),
    );
  }
}
