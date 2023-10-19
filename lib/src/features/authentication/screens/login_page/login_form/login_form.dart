import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/common_widgets/button/custom_elevated_button.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:visualarch_v1/src/features/authentication/screens/login_page/forget_password/forget_password_options/forget_modal_bottom_sheet.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../../../../common_widgets/dialog/custom_dialog.dart';
import '../../../controllers/authentication_controller.dart';
import '../../sign_up_page/sign_up_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  final controller = Get.put(AuthenticationController());

  @override
  void dispose() {
    super.dispose();
    controller.clearText();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              validator: Validators.compose([
                Validators.required("Este campo esta vacio!"),
                Validators.email("Correo no valido!")
              ]),
              controller: controller.email,
              decoration: textFieldEmailDecoration,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: Validators.compose([
                Validators.required("Este campo esta vacio!"),
              ]),
              controller: controller.password,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  hintText: "Contraseña",
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(20, 20))),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(20, 20)),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(20, 20)),
                    borderSide: BorderSide(color: Colors.red.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility),
                  )),
              keyboardType: TextInputType.visiblePassword,
              obscureText: _obscureText,
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
                        .login(controller.email.text, controller.password.text);
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
                        Get.to(() => const SignUpPage())?.then((value) {
                          controller.clearText();
                        });
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
