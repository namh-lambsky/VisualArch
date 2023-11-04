import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/common_widgets/modal/modal_image.dart';
import 'package:visualarch_v1/src/constants/colors.dart';

import '../../constants/images_strings.dart';
import '../../features/authentication/controllers/signup_controller.dart';

class UserImageRegister extends StatelessWidget {
  final bool isCustomizable;
  final double width;
  final double height;

  UserImageRegister({
    Key? key,
    this.isCustomizable = false,
    this.width=150,
    this.height=150
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Column(
      children: <Widget>[
        Stack(
          children: [
            SizedBox(
              width: width,
              height: height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Obx(
                  () => (controller.imageUrl.value == "")
                      ? Center(
                          child: SvgPicture.asset(
                            accIcon,
                            width: width,
                            height: height,
                          ),
                        )
                      : Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade800,
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: FileImage(
                                File(
                                  controller.imageUrl.value,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ),
            if (isCustomizable)
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: primaryColor),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => ModalImage(),
                            backgroundColor: backgroundColor);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                        size: 30,
                      )),
                ),
              )
          ],
        ),
      ],
    );
  }
}
