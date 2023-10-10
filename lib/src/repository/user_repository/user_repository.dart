import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/authentication/models/user_model.dart';

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
      await _db.collection("users").add(user.toJson());
      returnMessage["bool"] = true;
      returnMessage["message"] = "Cuenta creada con exito!";
      return returnMessage;
    } on FirebaseException catch (e) {
      returnMessage["bool"] = false;
      returnMessage["message"] = e.message;
      return returnMessage;
    } catch (_) {
      returnMessage["bool"] = false;
      returnMessage["message"] = "error desconocido :(";
      return returnMessage;
    }
  }

}
