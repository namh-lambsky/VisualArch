import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/authentication/models/user_model.dart';
import 'package:visualarch_v1/src/repository/authentication_repository/auth_repo.dart';
import 'package:visualarch_v1/src/repository/user_repository/user_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final passwordC = TextEditingController();
  final fullname = TextEditingController();
  final phone = TextEditingController();

  final userRepo = Get.put(UserRepository());
  final authRepo = Get.put(AuthenticationRepository());

  Future<Map<String, dynamic>> createUser(
    String email,
    String name,
    String phone,
    String password,
  ) async {
    await authRepo.createUserAuth(email, password);
    clearText();
    UserModel user = UserModel(
      id: authRepo.firebaseUser.value!.uid,
      email: email,
      name: name,
      phone: phone,
    );

    return await userRepo.createUserDB(user);
  }

  void clearText() {
    email.clear();
    password.clear();
    passwordC.clear();
    fullname.clear();
    phone.clear();
  }
}
