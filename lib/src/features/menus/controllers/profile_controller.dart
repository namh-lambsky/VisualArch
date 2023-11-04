import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visualarch_v1/src/features/authentication/models/user_model.dart';
import 'package:visualarch_v1/src/repository/authentication_repository/auth_repo.dart';
import 'package:visualarch_v1/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  var imageUrl = "".obs;
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    }
  }

  getUserPhoto() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      _userRepo
          .getProfileImageURL(email)
          .then((String url) => imageUrl.value = url);
    }
  }

  updateRecord(UserModel user) async {
    final id = _authRepo.firebaseUser.value!.uid;
    await _userRepo.updateUser(user, id);
  }
}
