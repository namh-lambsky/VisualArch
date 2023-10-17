import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/authentication/controllers/authentication_controller.dart';
import 'package:visualarch_v1/src/features/authentication/controllers/signup_controller.dart';
import 'package:visualarch_v1/src/repository/authentication_repository/auth_repo.dart';
import 'package:visualarch_v1/src/repository/user_repository/user_repository.dart';

Future<void> init() async {
  Get.put(SignupController());
  Get.put(AuthenticationController());
}