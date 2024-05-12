import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/common_widgets/missing/on_development.dart';
import 'package:visualarch_v1/src/features/authentication/screens/login_page/forget_password/forget_password_mail/forget_password_mail_screen.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/styles.dart';
import 'forget_password_options_button.dart';

class ForgetModalBottomSheet {
  void buildModalBottomSheetForgotPassword(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        isScrollControlled: true,
        backgroundColor: modalBackgroundColor,
        context: context,
        builder: (context) => DraggableScrollableSheet(
              initialChildSize: 0.4,
              maxChildSize: 0.6,
              minChildSize: 0.32,
              expand: false,
              builder:
                  (BuildContext context, ScrollController scrollController) =>
                      SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Recupera tu cuenta!", style: titleStyle),
                    const Text(
                      "Selecciona una opción a continuación para recuperar tu cuenta:",
                      style: subtitleStyle,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ForgetPasswordOptionsButton(
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(() => const ForgetPasswordMailScreen());
                      },
                      title: "E-mail",
                      subtitle:
                          "Enviar mensaje recuperación \nde cuenta vía E-mail",
                      icon: const Icon(Icons.email_outlined,
                          size: 60, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ForgetPasswordOptionsButton(
                      onTap: () {Get.to(()=>const OnDevelopment());},
                      title: "Mensaje de texto",
                      subtitle:
                          "Enviar mensaje recuperación \nde cuenta vía Mensaje de texto \n(NO IMPLEMENTADO AÚN)",
                      icon: const Icon(Icons.send_to_mobile,
                          size: 60, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ));
  }
}
