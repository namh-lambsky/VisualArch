import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout/layout.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/features/authentication/models/user_model.dart';

import '../../../../../common_widgets/button/custom_elevated_button.dart';
import '../../../../../constants/images_strings.dart';
import '../../../../../constants/styles.dart';
import '../../../controllers/profile_controller.dart';

class UpdateProfileMobile extends StatelessWidget {
  const UpdateProfileMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final formKey = GlobalKey<FormState>();
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
            "Editar Perfil",
            style: titleStyle,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(padding * 4),
        child: FutureBuilder(
          future: controller.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel userData=snapshot.data as UserModel;
                return Column(
                  children: [
                    Stack(
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
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                            child: const Icon(
                              LineAwesomeIcons.camera,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                        key: formKey,
                        child: Column(children: [
                          TextFormField(
                            initialValue: userData.name,
                            decoration: textFieldNameDecoration,
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            initialValue: userData.email,
                            decoration: textFieldEmailDecoration,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            initialValue: userData.phone,
                            decoration: textFieldPhoneDecoration,
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomElevatedButton(
                              btText: "Guardar",
                              onPressed: () {},
                              btStyle: primaryButton),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomElevatedButton(
                              btText: "Borrar",
                              onPressed: () {},
                              btStyle: warningButton),
                        ]))
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
                return const Text(
                  "Algo salio mal :C",
                  style: titleStyle,
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )),
    );
  }
}
