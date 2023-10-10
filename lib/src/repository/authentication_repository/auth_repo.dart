import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/authentication/screens/landing_page/landing_page.dart';
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

    ever(firebaseUser, _setInitialScreen);
  }

  Map<String, dynamic> loadMessage(bool value, String message){
    Map<String, dynamic> returnMessage = {
      "bool": value,
      "message": message
    };
    return returnMessage;
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LandingPage())
        : Get.offAll(() => const MainMenu());
  }

  Future<Map<String, dynamic>> createUserAuth(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return loadMessage(true, "");
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure(e.code);
      return loadMessage(false, ex.message);
    } catch (_) {
      return loadMessage(false, "Error desconocido");
    }
  }

  Future<Map<String, dynamic>> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return loadMessage(true, "");
    } on FirebaseAuthException catch (e) {
      final ex = SignInWithEmailAndPasswordFailure(e.code);
      return loadMessage(false, ex.message);
    } catch (_) {
      return loadMessage(false, "Error desconocido");
    }
  }

  Future<Map<String, dynamic>> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      return loadMessage(true, "");
    } on FirebaseAuthException catch (ex) {
      return loadMessage(false, ex.toString());
    } catch (_) {
      return loadMessage(false, "Error desconocido");
    }
  }

  Future<void> logout() async => await _auth.signOut();

  Future<Map<String, dynamic>> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return loadMessage(true, "Revisa tu correo! en contados instantes te llegará un link para recuperar tu cuenta");
    } on FirebaseAuthException catch (ex) {
      return loadMessage(false, ex.toString());
    }
  }
}
