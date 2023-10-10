import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/repository/authentication_repository/auth_repo.dart';

class MailVerificationController extends GetxController {
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerAutoRedirect();
  }

  Future<Map<String, dynamic>> sendVerificationEmail() {
    return AuthenticationRepository.instance.sendEmailVerification();
  }

  void setTimerAutoRedirect() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        timer.cancel();
        //AuthenticationRepository.instance.setInitialScreen(user);

      }
    });
  }

  void manuallyCheckEmailVerificationStatus() {}
}
