import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/authentication/models/user_model.dart';

import '../../common_widgets/dialog/custom_dialog.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUserDB(
      UserModel user) async {
    try {
      await _db.collection("users").doc(user.id).set(user.toJson());
      Get.dialog(
        CustomDialog(
            title: "Exito!",
            iconData: Icons.check_circle_outline,
            nextCallback: () => Get.back(),
            message: "Usuario creado exitosamente!",
            iconColor: Colors.lightGreen),
      );
    } on FirebaseException catch (e) {
      Get.dialog(
        CustomDialog(
            title: "Error!",
            iconData: Icons.cancel_outlined,
            nextCallback: () => Get.back(),
            message: e.toString(),
            iconColor: Colors.redAccent),
      );
    } catch (_) {
      Get.dialog(
        CustomDialog(
            title: "Error!",
            iconData: Icons.cancel_outlined,
            nextCallback: () => Get.back(),
            message: "Error desconocido, intente de nuevo más tarde",
            iconColor: Colors.redAccent),
      );
    }
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot=await _db.collection('users').where("email",isEqualTo: email).get();
    final userData=snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> getAllUserDetails(String email) async {
    final snapshot=await _db.collection('users').get();
    final userData=snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void>updateUser(UserModel user,String id)async{

    try {
      await _db.collection("users").doc(id).update(user.toJson());
      Get.dialog(
        CustomDialog(
            title: "Exito!",
            iconData: Icons.check_circle_outline,
            nextCallback: () => Get.back(),
            message: "Usuario actualizado exitosamente!",
            iconColor: Colors.lightGreen),
      );
    } on Exception catch (e) {
      Get.dialog(
        CustomDialog(
            title: "Error!",
            iconData: Icons.cancel_outlined,
            nextCallback: () => Get.back(),
            message: e.toString(),
            iconColor: Colors.redAccent),
      );
    }
  }

}
