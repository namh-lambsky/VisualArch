import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/common_widgets/modal/modal_image.dart';
import 'package:visualarch_v1/src/common_widgets/modal/modal_image_update.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:visualarch_v1/src/features/menus/controllers/profile_controller.dart';

import '../../constants/images_strings.dart';
import '../../features/authentication/controllers/signup_controller.dart';

class UserImage extends StatelessWidget {
  final bool isCustomizable;
  final double width;
  final double height;

  UserImage({
    Key? key,
    this.isCustomizable = false,
    this.width = 150,
    this.height = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    controller.initialCall();

    if (isCustomizable) {
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
                                image: controller.provider,
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
    } else {
      return FutureBuilder(
          future: controller.getUserPhoto(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                String imageURL = snapshot.data.toString();
                return Column(
                  children: <Widget>[
                    Stack(
                      children: [
                        SizedBox(
                          width: width,
                          height: height,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: (imageURL == "")
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
                                        image: NetworkImage(imageURL),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: titleStyle,
                  ),
                );
              } else {
                return Icon(
                  Icons.error_rounded,
                  color: Colors.red,
                  size: width,
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }
  }
}
