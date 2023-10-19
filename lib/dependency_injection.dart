import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/authentication/controllers/authentication_controller.dart';
import 'package:visualarch_v1/src/features/authentication/controllers/signup_controller.dart';

Future<void> init() async {
  Get.put(SignupController());
  Get.put(AuthenticationController());
}