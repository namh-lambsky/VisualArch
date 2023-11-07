import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visualarch_v1/src/features/authentication/models/user_model.dart';
import 'package:visualarch_v1/src/repository/authentication_repository/auth_repo.dart';
import 'package:visualarch_v1/src/repository/user_repository/user_repository.dart';

import '../../../constants/colors.dart';
import '../../../utils/image_helper.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  final _imageHelper = Get.put(ImageHelper());

  XFile? imageFile;
  var imageUrl = "".obs;
  var hasChanged = false.obs;
  var provider;

  initialCall() async {
    imageUrl.value = await getUserPhoto();
    provider=NetworkImage(imageUrl.value);
  }

  swapProvider(){
    if (hasChanged.value) {
      provider = FileImage(
        File(
          imageUrl.value,
        ),
      );
      print("ola");
    } else {
      provider = NetworkImage(imageUrl.value);
      print("xd");
    }
  }

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

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    }
  }

  getUserPhoto() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getProfileImageURL(email);
    }
  }

  updateRecord(UserModel user) async {
    final id = _authRepo.firebaseUser.value!.uid;
    await _userRepo.updateUser(user, id);
  }
}
