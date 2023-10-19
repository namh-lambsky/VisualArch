import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/images_strings.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/menus/screens/profile_screen/profile_menu.dart';

import 'item_card/item_card.dart';

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
          color: Colors.transparent,
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
                Get.to(() => const ProfileMenu());
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(padding * 4),
              child: const Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Bienvenido! ", style: subtitleStyle),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Recorridos recientemente añadidos",
                    style: titleStyle,
                  ),
                ],
              ),
            ),
            Container(
              height: 350,
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const ItemCard(
                      builderName: "Amarilo",
                      builderLogoPath: amariloLogo,
                      projectName: "Balcones del portal",
                      projectLogoPath: projectLogo,
                      imagePath: projectImage,
                      city: "Bogotá",
                      price: 188200000,
                      area: 51,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
