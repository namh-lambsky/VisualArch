import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/common_widgets/dialog/custom_dialog.dart';
import 'package:visualarch_v1/src/features/authentication/controllers/signup_controller.dart';
import 'package:visualarch_v1/src/features/authentication/models/user_model.dart';
import 'package:visualarch_v1/src/features/authentication/screens/login_page/login_page.dart';

import '../../../../../common_widgets/button/custom_elevated_button.dart';
import '../../../../../constants/styles.dart';
import '../../../controllers/authentication_controller.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationController());
    final formKey = GlobalKey<FormState>();

    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.fullname,
              decoration: textFieldNameDecoration,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
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
            TextFormField(
              controller: controller.passwordC,
              decoration: textFieldPasswordRDecoration,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.phone,
              decoration: textFieldPhoneDecoration,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomElevatedButton(
                btText: "Registrarse",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (controller.password.text == controller.passwordC.text) {
                      UserModel user = UserModel(
                          email: controller.email.text.trim(),
                          name: controller.fullname.text,
                          password: controller.password.text,
                          phone: controller.phone.text);

                      Map<String, dynamic> values;
                      SignupController.instance
                          .createUser(user)
                          .then((Map<String, dynamic> map) {
                        setState(() {
                          values = map;
                          showDialog(
                              context: context,
                              builder: (context) => CustomDialog(
                                    value: values['bool'],
                                    message: values['message'],
                                  ));
                        });
                      });
                    }
                  }
                },
                btStyle: primaryButton),
            const SizedBox(
              height: 40,
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Ya tienes una cuenta?",
                          style: extraLightStyle),
                      TextButton(
                          onPressed: () {
                            Get.to(() => const LoginPage());
                          },
                          child: const Text(
                            "Inicia sesión",
                            style: extraLightStyle,
                          ))
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
