import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:visualarch_v1/src/features/authentication/screens/landing_page/landing_page.dart';
import 'package:visualarch_v1/dependency_injection.dart' as di;
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'firebase_options.dart';
import 'package:layout/layout.dart';

void main() async {
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) async {
    await di.init();
  });
  SystemChrome.setPreferredOrientations
    ([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      title: "VisualArch",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        useMaterial3: true,
      ),
      home: const LandingPage(),
    ));
  }
}
