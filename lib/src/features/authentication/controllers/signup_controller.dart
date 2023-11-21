import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/features/authentication/models/user_model.dart';
import 'package:visualarch_v1/src/repository/authentication_repository/auth_repo.dart';
import 'package:visualarch_v1/src/repository/user_repository/user_repository.dart';
import 'package:visualarch_v1/src/utils/image_helper.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    clearFields();
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<SignupController>();
    clearFields();
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<SignupController>();
    clearFields();
  }

  XFile? imageFile;
  var imageUrl = "".obs;

  final obscureText = true.obs;
  final obscureTextC = true.obs;

  final email = TextEditingController();
  final password = TextEditingController();
  final passwordC = TextEditingController();
  final fullname = TextEditingController();
  final phone = TextEditingController();

  final _imageHelper = Get.put(ImageHelper());
  final userRepo = Get.put(UserRepository());
  final authRepo = Get.put(AuthenticationRepository());

  pickProfileImage(ImageSource source) async {
    final files = await _imageHelper.pickImage(source: source);
    if (files.isNotEmpty) {
      Get.back();
      final croppedFile = await _imageHelper.crop(
          file: files.first, cropStyle: CropStyle.circle);
      if (croppedFile != null) {
        imageFile = XFile(croppedFile.path);
        imageUrl.value = imageFile!.path;

        Get.snackbar(
          "Foto de perfil",
          "Se subio la foto de perfil de forma exitosa",
          colorText: Colors.white,
          icon: const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 20,
          ),
          backgroundColor: backgroundColor.withOpacity(0.7),
          animationDuration: const Duration(
            milliseconds: 1700,
          ),
        );
      } else {
        Get.snackbar(
          "Error",
          "No se subio la foto de perfil",
          colorText: Colors.white,
          icon: const Icon(
            Icons.cancel_outlined,
            color: Colors.red,
            size: 20,
          ),
          backgroundColor: backgroundColor.withOpacity(0.7),
          animationDuration: const Duration(
            milliseconds: 1700,
          ),
        );
      }
    }
  }

  Future<void> createUser(
    String email,
    String name,
    String phone,
    String password,
  ) async {
    await authRepo.createUserAuth(email, password);
    UserModel user = UserModel(
      id: authRepo.firebaseUser.value!.uid,
      email: email,
      name: name,
      phone: phone,
    );
    await userRepo.createUserDB(user, imageFile!);
    authRepo.setInitialScreen(authRepo.firebaseUser.value);
    clearFields();
  }

  void clearFields() {
    email.clear();
    password.clear();
    passwordC.clear();
    fullname.clear();
    phone.clear();
    imageFile = null;
    imageUrl.value = "";
  }
}
