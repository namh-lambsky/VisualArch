import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/common_widgets/button/custom_elevated_button.dart';
import 'package:visualarch_v1/src/constants/styles.dart';
import 'package:visualarch_v1/src/features/authentication/screens/login_page/login_page.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../../../controllers/signup_controller.dart';
import '../verify_email/verify_email.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
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
          Obx(
            () => TextFormField(
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
                      controller.obscureText.value =
                          !controller.obscureText.value;
                    },
                    child: Icon(controller.obscureText.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )),
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.obscureText.value,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => TextFormField(
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
                      controller.obscureTextC.value =
                          !controller.obscureTextC.value;
                    },
                    child: Icon(controller.obscureTextC.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )),
              keyboardType: TextInputType.visiblePassword,
              obscureText: controller.obscureTextC.value,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: Validators.compose([
              Validators.required("Este campo esta vacio!"),
              Validators.patternString(
                  r'^3\d{9}$', "Este no es numero telfonico valido!")
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
                    controller.createUser(
                        controller.email.text.trim(),
                        controller.fullname.text,
                        controller.phone.text,
                        controller.password.text);
                    Get.to(() => const VerifyEmail());
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
                    const Text("Ya tienes una cuenta?", style: extraLightStyle),
                    TextButton(
                        onPressed: () {
                          Get.to(() => const LoginPage())?.then((value) {
                            controller.clearFields();
                          });
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
      ),
    );
  }
}
