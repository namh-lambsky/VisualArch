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

  @override
  void dispose() {
    super.dispose();
    Get.delete<AuthenticationController>();
    clearText();
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<AuthenticationController>();
    clearText();
  }

  var obscureText = true.obs;

  final email = TextEditingController();
  final password = TextEditingController();
  final passwordC = TextEditingController();
  final fullname = TextEditingController();
  final phone = TextEditingController();

  final auth = AuthenticationRepository.instance;

  void resetPasswordByEmail(String email) {
    clearText();
    auth.resetPassword(email);
  }

  Future<void> login(String email, String password) async {
    clearText();
    await auth.loginUserWithEmailAndPassword(email, password);
    auth.setInitialScreen(auth.firebaseUser.value);
  }

  void logout() {
    clearText();
    auth.logout();
    auth.setInitialScreen(null);
  }

  void clearText() {
    email.clear();
    password.clear();
    passwordC.clear();
    fullname.clear();
    phone.clear();
  }
}
