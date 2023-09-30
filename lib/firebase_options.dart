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
    apiKey: 'AIzaSyCAuw3UIyBvCmL6n1Oai8iyBgBZFCL15QM',
    appId: '1:540853008508:web:b9e2dd12827d140dc971f9',
    messagingSenderId: '540853008508',
    projectId: 'pomodroapp-13be0',
    authDomain: 'pomodroapp-13be0.firebaseapp.com',
    storageBucket: 'pomodroapp-13be0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAe6TNtvJO6SS__SfV5Xi17IMNo6ehlIRQ',
    appId: '1:540853008508:android:34bcc9967bcf1507c971f9',
    messagingSenderId: '540853008508',
    projectId: 'pomodroapp-13be0',
    storageBucket: 'pomodroapp-13be0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDU-vAJk6wR8ORSoRczJKWso-el76Sw1ic',
    appId: '1:540853008508:ios:07e02454675e25a1c971f9',
    messagingSenderId: '540853008508',
    projectId: 'pomodroapp-13be0',
    storageBucket: 'pomodroapp-13be0.appspot.com',
    iosBundleId: 'com.example.pomodroapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDU-vAJk6wR8ORSoRczJKWso-el76Sw1ic',
    appId: '1:540853008508:ios:b366793f0f0d8a34c971f9',
    messagingSenderId: '540853008508',
    projectId: 'pomodroapp-13be0',
    storageBucket: 'pomodroapp-13be0.appspot.com',
    iosBundleId: 'com.example.pomodroapp.RunnerTests',
  );
}