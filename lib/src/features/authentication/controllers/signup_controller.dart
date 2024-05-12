import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:visualarch_v1/src/constants/colors.dart';
import 'package:visualarch_v1/src/constants/images_strings.dart';
import 'package:visualarch_v1/src/features/authentication/models/user_model.dart';
import 'package:visualarch_v1/src/repository/authentication_repository/auth_repo.dart';
import 'package:visualarch_v1/src/repository/user_repository/user_repository.dart';
import 'package:visualarch_v1/src/utils/image_helper.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  @override
  void onInit() async{
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
        return;
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

  void getImageFileFromAssets() async {
    final byteData = await rootBundle.load('./$accIMG');
    if(byteData.toString()!=""){
      print("siuuuu");
      print(byteData.toString());
    }
    final file = File('${(await getTemporaryDirectory()).path}/images/account_icon.png');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    XFile xFile = XFile(file.path);
    imageFile = xFile;
    print("img: $imageFile");
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

    if(imageFile==null){
      print("ola?");
      getImageFileFromAssets();
    }

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
