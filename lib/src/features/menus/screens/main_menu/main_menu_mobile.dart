import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/images_strings.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/menus/controllers/profile_controller.dart';
import 'package:visualarch_v1/src/features/menus/screens/profile_screen/profile_menu.dart';

import '../../../../common_widgets/user_image/user_image.dart';
import 'item_card/item_card.dart';

class MainMenuMobile extends StatelessWidget {
  const MainMenuMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    controller.getUserPhoto();
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
          GestureDetector(
            onTap: () {
              Get.to(() => const ProfileMenu(),
                  transition: Transition.rightToLeftWithFade);
            },
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                border: Border.all(
                  color: Colors.green.withOpacity(0.7),
                  width: 2.0,
                ),
              ),
              child: UserImage(
                width: 50,
                height: 50,
              ),
            ),
          ),
        ],
      ),
      body: Column(
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
            height: 450,
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
    );
  }
}
