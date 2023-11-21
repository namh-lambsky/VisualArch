import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/images_strings.dart';
import '../../constants/styles.dart';
import '../../features/menus/screens/profile_screen/profile_menu.dart';
import '../user_image/user_image.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final bool hasBackButton;
  final bool showProfilePhoto;
  const CustomAppbar({Key? key,this.hasBackButton=false,this.showProfilePhoto=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasBackButton? IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )): const Icon(
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
      actions: [showProfilePhoto?
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
        ):const SizedBox(width: 50,),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(
    double.maxFinite,
    80,
  );
}
