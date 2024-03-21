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
    apiKey: 'AIzaSyD9BvKswTPe7m2ZTH54UfCRvC6ZQGD1pIc',
    appId: '1:276286431098:web:578a1f87989ba5cb0a00c3',
    messagingSenderId: '276286431098',
    projectId: 'go-grub',
    authDomain: 'go-grub.firebaseapp.com',
    storageBucket: 'go-grub.appspot.com',
    measurementId: 'G-CMNM881N8M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyByCM8DVSi4WGIhPHoC2t2BUTT5Z4j5Zgg',
    appId: '1:276286431098:android:72231ba7f0e31f4a0a00c3',
    messagingSenderId: '276286431098',
    projectId: 'go-grub',
    storageBucket: 'go-grub.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIlDL2axNAUggeS4J_yw5ecuhIRELqNok',
    appId: '1:276286431098:ios:1de9b2d3c2e1e1c50a00c3',
    messagingSenderId: '276286431098',
    projectId: 'go-grub',
    storageBucket: 'go-grub.appspot.com',
    iosBundleId: 'com.example.goGrub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIlDL2axNAUggeS4J_yw5ecuhIRELqNok',
    appId: '1:276286431098:ios:8f8f7a42d398403c0a00c3',
    messagingSenderId: '276286431098',
    projectId: 'go-grub',
    storageBucket: 'go-grub.appspot.com',
    iosBundleId: 'com.example.goGrub.RunnerTests',
  );
}