import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/authentication/models/user_model.dart';
import 'package:visualarch_v1/src/utils/return_message.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  late final Map<String, dynamic> returnMessage = {
    "bool": false,
    "message": ""
  };

  Future<Map<String, dynamic>> createUserDB(
      UserModel user) async {
    try {
      await _db.collection("users").doc(user.id).set(user.toJson());
      return loadMessage(true, "Cuenta creada con exito!");
    } on FirebaseException catch (e) {
      return loadMessage(false, e.toString());
    } catch (_) {
      return loadMessage(false, "Error Desconocido :c");
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

}
