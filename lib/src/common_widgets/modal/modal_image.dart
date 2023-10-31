import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:layout/layout.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/styles.dart';

class ModalImage extends StatelessWidget {
  const ModalImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = context.layout.size;

    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Foto de perfil",
            style: titleStyle,
          ),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                child: const Column(
                  children: [
                    Icon(Icons.image,size: 50,color: Colors.white,),
                    Text(
                      "Galería",
                      style: subtitleStyleS,
                    )
                  ],
                ),
                onTap: () {takePhoto(ImageSource.gallery);},
              ),
              const SizedBox(width: 20,),
              InkWell(
                child: const Column(
                  children: [
                    Icon(Icons.camera_alt_rounded,size: 50,color: Colors.white,),
                    Text(
                      "Cámara",
                      style: subtitleStyleS,
                    )
                  ],
                ),
                onTap: () {takePhoto(ImageSource.camera);},
              )
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) {}
}
