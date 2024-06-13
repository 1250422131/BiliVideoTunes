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
    apiKey: 'AIzaSyBqtAld7iT8GGzltNmiTtxuttdPXgIt7uk',
    appId: '1:1095515545580:web:35536197b380219d472ac9',
    messagingSenderId: '1095515545580',
    projectId: 'bilivideotunes',
    authDomain: 'bilivideotunes.firebaseapp.com',
    storageBucket: 'bilivideotunes.appspot.com',
    measurementId: 'G-8XY8HRERK3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZ4wo9fGJPU77cBH2w8k2jh9C05OXSEyc',
    appId: '1:1095515545580:android:dc9144987f5d765b472ac9',
    messagingSenderId: '1095515545580',
    projectId: 'bilivideotunes',
    storageBucket: 'bilivideotunes.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnVzFsqaX6IMbsuC_z3eVuOIGHZh1B468',
    appId: '1:1095515545580:ios:dd7abea4ba9216cb472ac9',
    messagingSenderId: '1095515545580',
    projectId: 'bilivideotunes',
    storageBucket: 'bilivideotunes.appspot.com',
    iosBundleId: 'com.imcys.bilivideotunes.biliVideoTunes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAnVzFsqaX6IMbsuC_z3eVuOIGHZh1B468',
    appId: '1:1095515545580:ios:dd7abea4ba9216cb472ac9',
    messagingSenderId: '1095515545580',
    projectId: 'bilivideotunes',
    storageBucket: 'bilivideotunes.appspot.com',
    iosBundleId: 'com.imcys.bilivideotunes.biliVideoTunes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBqtAld7iT8GGzltNmiTtxuttdPXgIt7uk',
    appId: '1:1095515545580:web:cad2f28e694fb59f472ac9',
    messagingSenderId: '1095515545580',
    projectId: 'bilivideotunes',
    authDomain: 'bilivideotunes.firebaseapp.com',
    storageBucket: 'bilivideotunes.appspot.com',
    measurementId: 'G-3D9RHYQFNP',
  );

}