import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/common_widgets/button/custom_elevated_button.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:visualarch_v1/src/features/authentication/screens/login_page/forget_password/forget_password_options/forget_modal_bottom_sheet.dart';

import '../../../../../common_widgets/dialog/custom_dialog.dart';
import '../../../controllers/authentication_controller.dart';
import '../../sign_up_page/sign_up_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationController());
    final formKey = GlobalKey<FormState>();

    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              decoration: textFieldEmailDecoration,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.password,
              decoration: textFieldPasswordDecoration,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetModalBottomSheet()
                      .buildModalBottomSheetForgotPassword(context);
                },
                child: const Text(
                  "Olvidaste tu contraseña?",
                  style: extraLightStyle,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomElevatedButton(
                btText: "Iniciar Sesión",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Map<String, dynamic> values;
                    AuthenticationController.instance
                        .login(controller.email.text, controller.password.text)
                        .then((Map<String, dynamic> map) {
                      setState(() {
                        values = map;
                        values['bool']?{}:
                        showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                                  value: values['bool'],
                                  message: values['message'],
                                ));
                      });
                    });
                  }
                },
                btStyle: primaryButton),
            const SizedBox(
              height: 30,
            ),
            Flex(direction: Axis.horizontal, children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("No tienes una cuenta?", style: extraLightStyle),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const SignUpPage());
                      },
                      child: const Text(
                        "Crea una cuenta",
                        style: extraLightStyle,
                      ),
                    )
                  ],
                ),
              ),
            ])
          ],
        ));
  }
}
