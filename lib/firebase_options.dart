// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAWupC2HtXfporZQKZkSEyUh1JPHGeInfs',
    appId: '1:169000393821:web:94dc637d2df60864f0c1b4',
    messagingSenderId: '169000393821',
    projectId: 'visualarch-back',
    authDomain: 'visualarch-back.firebaseapp.com',
    storageBucket: 'visualarch-back.appspot.com',
    measurementId: 'G-LNVQQ4M8JJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOTnxglqy5MDGkLVRZhEGduVA-nl9sNSE',
    appId: '1:169000393821:android:6847cd4356b92cb9f0c1b4',
    messagingSenderId: '169000393821',
    projectId: 'visualarch-back',
    storageBucket: 'visualarch-back.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGCG2nFvPMwATABEniQ0HgULedwtHRE_g',
    appId: '1:169000393821:ios:29dda8fd3cb91073f0c1b4',
    messagingSenderId: '169000393821',
    projectId: 'visualarch-back',
    storageBucket: 'visualarch-back.appspot.com',
    iosBundleId: 'com.example.visualarchV1',
  );
}
