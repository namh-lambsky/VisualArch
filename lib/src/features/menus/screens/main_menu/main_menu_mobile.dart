import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/images_strings.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:visualarch_v1/src/repository/authentication_repository/auth_repo.dart';

class MainMenuMobile extends StatelessWidget {
  const MainMenuMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding = context.layout.value(xs: 8);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              miniIcon,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                "VisualArch",
                style: titleStyle,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: IconButton(
              onPressed: () {
                AuthenticationRepository.instance.logout();
              },
              icon: const Image(
                image: AssetImage(accIcon),
                height: 50,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(padding * 4),
        child: const Column(
          children: [
            Text(
              "zapato",
              style: titleStyle,
            )
          ],
        ),
      ),
    );
  }
}
