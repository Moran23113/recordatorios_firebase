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
    apiKey: 'AIzaSyAoFsNS9NjlaOdO913VMMAALdnOxj1EA0M',
    appId: '1:919850976276:web:794af5d70784b99008d301',
    messagingSenderId: '919850976276',
    projectId: 'fir-workshop-12e83',
    authDomain: 'fir-workshop-12e83.firebaseapp.com',
    storageBucket: 'fir-workshop-12e83.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDj2NVOjPD6pFsOiFsyJV7YFqeoELqFFVw',
    appId: '1:919850976276:android:98aac2edbc0882ac08d301',
    messagingSenderId: '919850976276',
    projectId: 'fir-workshop-12e83',
    storageBucket: 'fir-workshop-12e83.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAF_q3ipNV7-e-GUfrxkWP6EkOMHSuPO0U',
    appId: '1:919850976276:ios:45cc5a0da70ae5fa08d301',
    messagingSenderId: '919850976276',
    projectId: 'fir-workshop-12e83',
    storageBucket: 'fir-workshop-12e83.appspot.com',
    iosBundleId: 'com.example.firebaseWorkshopProgra',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAF_q3ipNV7-e-GUfrxkWP6EkOMHSuPO0U',
    appId: '1:919850976276:ios:45cc5a0da70ae5fa08d301',
    messagingSenderId: '919850976276',
    projectId: 'fir-workshop-12e83',
    storageBucket: 'fir-workshop-12e83.appspot.com',
    iosBundleId: 'com.example.firebaseWorkshopProgra',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAoFsNS9NjlaOdO913VMMAALdnOxj1EA0M',
    appId: '1:919850976276:web:549141f635dbfd4c08d301',
    messagingSenderId: '919850976276',
    projectId: 'fir-workshop-12e83',
    authDomain: 'fir-workshop-12e83.firebaseapp.com',
    storageBucket: 'fir-workshop-12e83.appspot.com',
  );
}
