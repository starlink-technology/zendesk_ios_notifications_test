// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAik0M1DiGJ1XgLPZd50X4N5D05xND6ACY',
    appId: '1:637963228551:web:4a54d1798c5026d1e16f22',
    messagingSenderId: '637963228551',
    projectId: 'tamweeniya-dev',
    authDomain: 'tamweeniya-dev.firebaseapp.com',
    storageBucket: 'tamweeniya-dev.firebasestorage.app',
    measurementId: 'G-S7EKEWYWKV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQO5-pNj-4SJSpxzc_YJttmIcy0p03nAQ',
    appId: '1:637963228551:android:5f37ad48bc5ed373e16f22',
    messagingSenderId: '637963228551',
    projectId: 'tamweeniya-dev',
    storageBucket: 'tamweeniya-dev.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqPbrFX6jWKngu_PBlu80HqO4xedP5_qs',
    appId: '1:637963228551:ios:d9b88c3a74ebffb4e16f22',
    messagingSenderId: '637963228551',
    projectId: 'tamweeniya-dev',
    storageBucket: 'tamweeniya-dev.firebasestorage.app',
    iosBundleId: 'com.starsphere.zendeskTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqPbrFX6jWKngu_PBlu80HqO4xedP5_qs',
    appId: '1:637963228551:ios:70bc645b115d0a20e16f22',
    messagingSenderId: '637963228551',
    projectId: 'tamweeniya-dev',
    storageBucket: 'tamweeniya-dev.firebasestorage.app',
    iosBundleId: 'com.example.zendeskTest',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAik0M1DiGJ1XgLPZd50X4N5D05xND6ACY',
    appId: '1:637963228551:web:e175dca0f0c4433fe16f22',
    messagingSenderId: '637963228551',
    projectId: 'tamweeniya-dev',
    authDomain: 'tamweeniya-dev.firebaseapp.com',
    storageBucket: 'tamweeniya-dev.firebasestorage.app',
    measurementId: 'G-PXKQLLGLN9',
  );
}
