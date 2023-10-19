import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/repository/authentication_repository/auth_repo.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    clearText();
  }

  final email = TextEditingController();
  final password = TextEditingController();
  final passwordC = TextEditingController();
  final fullname = TextEditingController();
  final phone = TextEditingController();

  void resetPasswordByEmail(String email) {
    clearText();
    AuthenticationRepository.instance.resetPassword(email);
  }

  void login(String email, String password) {
    clearText();
    AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
  }

  void logout() {
    AuthenticationRepository.instance.logout();
    clearText();
  }

  void clearText() {
    email.clear();
    password.clear();
    passwordC.clear();
    fullname.clear();
    phone.clear();
  }
}
