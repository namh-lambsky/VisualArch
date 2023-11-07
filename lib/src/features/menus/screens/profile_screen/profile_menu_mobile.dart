import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:visualarch_v1/src/common_widgets/user_image/user_image.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/durations.dart';
import 'package:visualarch_v1/src/features/authentication/controllers/authentication_controller.dart';
import 'package:visualarch_v1/src/features/authentication/models/user_model.dart';
import 'package:visualarch_v1/src/features/menus/screens/profile_screen/update_profile/update_profile.dart';

import '../../../../constants/styles.dart';
import '../../controllers/profile_controller.dart';
import 'list_widget/profile_list_widget.dart';

class ProfileMenuMobile extends StatelessWidget {
  const ProfileMenuMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    double padding = context.layout.value(xs: 8);

    return FutureBuilder(
        future: controller.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel user= snapshot.data as UserModel;

              String fullname=user.name;
              String email=user.email;


              return Scaffold(
                backgroundColor: backgroundColor,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        LineAwesomeIcons.angle_left,
                        color: Colors.white,
                      )),
                  title: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      "Perfil",
                      style: titleStyle,
                    ),
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(padding * 4),
                    child: Column(
                      children: [
                        Container(
                          width: 155,
                          height: 155,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                            border: Border.all(
                              color: Colors.green.withOpacity(0.7),
                              width: 2.0,
                            ),
                          ),
                          child: UserImage(
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          fullname,
                          style: titleStyle,
                        ),
                        Text(
                          email,
                          style: subtitleStyle,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Divider(
                          color: Colors.transparent,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ProfileListWidget(
                          title: "Configuración de perfil",
                          onPressed: () {
                            Get.to(() => const UpdateProfile(),transition: Transition.rightToLeftWithFade,duration: defaultTransitionD);
                          },
                          icon: LineAwesomeIcons.cog,
                          endIcon: true,
                        ),
                        ProfileListWidget(
                          title: "Métodos de pago",
                          onPressed: () {},
                          icon: LineAwesomeIcons.wallet,
                          endIcon: true,
                        ),
                        const Divider(
                          color: Colors.transparent,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ProfileListWidget(
                          title: "Cerrar Sesión",
                          icon: LineAwesomeIcons.alternate_sign_out,
                          endIcon: false,
                          onPressed: () {
                            AuthenticationController.instance.logout();
                          },
                          textColor: Colors.red,
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: titleStyle,
                ),
              );
            } else {
              return const Icon(
                Icons.error_rounded,
                color: Colors.red,
                size: 45,
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
