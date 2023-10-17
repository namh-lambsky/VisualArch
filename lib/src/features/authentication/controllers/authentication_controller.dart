import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/repository/authentication_repository/auth_repo.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final passwordC = TextEditingController();
  final fullname = TextEditingController();
  final phone = TextEditingController();

  Future<Map<String, dynamic>> resetPasswordByEmail(String email) {
    clearText();
    return AuthenticationRepository.instance.resetPassword(email);
  }

  Future<Map<String, dynamic>> login(String email, String password) {
    clearText();
    return AuthenticationRepository.instance
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
