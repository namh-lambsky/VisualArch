import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:visualarch_v1/src/repository/authentication_repository/auth_repo.dart';

import 'firebase_options.dart';
import 'package:layout/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: GetMaterialApp(
      title: "VisualArch",
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LandingPage(),
    ));
  }
}
