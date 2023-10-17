import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:visualarch_v1/src/common_widgets/button/custom_elevated_button.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/images_strings.dart';
import 'package:visualarch_v1/src/features/authentication/controllers/authentication_controller.dart';
import 'package:visualarch_v1/src/features/menus/screens/profile_screen/update_profile/update_profile.dart';

import '../../../../constants/styles.dart';
import 'list_widget/profile_list_widget.dart';

class ProfileMenuMobile extends StatelessWidget {
  const ProfileMenuMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding = context.layout.value(xs: 8);

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
              SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage(accIcon),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Nombre Usuario",
                style: titleStyle,
              ),
              const Text(
                "correo",
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
                onPressed: (){Get.to(()=>const UpdateProfile());},
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
  }
}
