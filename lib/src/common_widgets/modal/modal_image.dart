import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/constants/styles.dart';

import '../../features/authentication/controllers/signup_controller.dart';

class ModalImage extends StatelessWidget {
  ModalImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = context.layout.size;
    final controller = Get.put(SignupController());

    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Escoge tu foto de perfil",
            style: titleStyle,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: const Column(
                  children: [
                    Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "Galería",
                      style: subtitleStyleS,
                    )
                  ],
                ),
                onTap: () async {
                  await controller.pickProfileImage(ImageSource.gallery);

                },
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                child: const Column(
                  children: [
                    Icon(
                      Icons.camera_alt_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "Cámara",
                      style: subtitleStyleS,
                    )
                  ],
                ),
                onTap: () async {
                  await controller.pickProfileImage(ImageSource.camera);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
