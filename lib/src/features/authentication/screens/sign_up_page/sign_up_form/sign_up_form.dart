import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/common_widgets/dialog/custom_dialog.dart';
import 'package:visualarch_v1/src/features/authentication/controllers/signup_controller.dart';
import 'package:visualarch_v1/src/features/authentication/models/user_model.dart';
import 'package:visualarch_v1/src/features/authentication/screens/login_page/login_page.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../../../../common_widgets/button/custom_elevated_button.dart';
import '../../../../../constants/styles.dart';
import '../../../controllers/authentication_controller.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscureText=true;
  bool _obscureTextC=true;
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
              ]),
              controller: controller.fullname,
              decoration: textFieldNameDecoration,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 20,
            ),
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
            TextFormField(
              validator: Validators.compose([
                Validators.required("Este campo esta vacio!"),
                Validators.patternString(
                    controller.password.text, "Las contraseñas no coinciden!")
              ]),
              controller: controller.passwordC,
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
                        _obscureTextC = !_obscureTextC;
                      });
                    },
                    child: Icon(
                        _obscureTextC ? Icons.visibility_off : Icons.visibility),
                  )),
              keyboardType: TextInputType.visiblePassword,
              obscureText: _obscureTextC,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: Validators.compose([
                Validators.required("Este campo esta vacio!"),
                Validators.patternString(r'^3\d{9}$',
                    "Este no es numero telfonico valido!")
              ]),
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
                      Map<String, dynamic> values;
                      SignupController.instance.createUser(
                          controller.email.text.trim(),
                          controller.fullname.text,
                          controller.phone.text,
                          controller.password.text);
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
                            Get.to(() => const LoginPage())?.then((value){controller.clearText();});
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
