import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/common_widgets/dialog/custom_dialog.dart';
import 'package:visualarch_v1/src/constants/other_constants.dart';
import 'package:visualarch_v1/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:visualarch_v1/src/features/authentication/screens/sign_up_page/verify_email/verify_email.dart';
import 'package:visualarch_v1/src/features/menus/screens/main_menu/main_menu.dart';
import 'package:visualarch_v1/src/repository/authentication_repository/exceptions/SignInWithEmailAndPasswordFailure.dart';

import 'exceptions/SignUpWithEmailAndPasswordFailure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    setInitialScreen(_auth.currentUser);
  }

  setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LandingPage(),
            transition: Transition.fade, duration: defaultTransitionD)
        : user.emailVerified
            ? Get.offAll(() => const MainMenu(),
                transition: Transition.fade, duration: defaultTransitionD)
            : Get.offAll(() => const VerifyEmail(),
                transition: Transition.fade, duration: defaultTransitionD);
  }

  Future sendVerificationEmail(User user) async {
    try {
      await user.sendEmailVerification();
    } on Exception catch (e) {
      Get.dialog(CustomDialog(
        title: "Error",
        iconData: Icons.cancel_outlined,
        nextCallback: () => Get.back(),
        message: e.toString(),
      ));
    }
  }

  Future<void> createUserAuth(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.dialog(
        CustomDialog(
            title: "Exito!",
            iconData: Icons.check_circle_outline,
            nextCallback: () => Get.back(),
            message: "Usuario creado exitosamente!",
            iconColor: Colors.lightGreen),
      );
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure(e.code);
      Get.dialog(
        CustomDialog(
            title: "Error!",
            iconData: Icons.cancel_outlined,
            nextCallback: () => Get.back(),
            message: ex.message,
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

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignInWithEmailAndPasswordFailure(e.code);
      Get.dialog(
        CustomDialog(
            title: "Error!",
            iconData: Icons.cancel_outlined,
            nextCallback: () => Get.back(),
            message: ex.message,
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

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (ex) {
      Get.dialog(
        CustomDialog(
            title: "Error!",
            iconData: Icons.cancel_outlined,
            nextCallback: () => Get.back(),
            message: ex.toString(),
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

  Future<void> logout() async => await _auth.signOut();

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.dialog(
        CustomDialog(
            title: "Exito!",
            iconData: Icons.check_circle_outline,
            nextCallback: () => Get.offAll(() => const LandingPage(),
                transition: Transition.fade, duration: defaultTransitionD),
            message:
                "Revisa tu correo! en contados instantes te llegará un link para recuperar tu cuenta",
            iconColor: Colors.lightGreen),
      );
    } on FirebaseAuthException catch (ex) {
      Get.dialog(
        CustomDialog(
            title: "Error!",
            iconData: Icons.cancel_outlined,
            nextCallback: () => Get.back(),
            message: ex.toString(),
            iconColor: Colors.redAccent),
      );
    }
  }
}
