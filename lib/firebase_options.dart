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
    apiKey: 'AIzaSyAIYLIOJWYWMBNh01yC2WvkZv3kV_IAYso',
    appId: '1:481070290258:web:7e50ddffa077e244a8168b',
    messagingSenderId: '481070290258',
    projectId: 'api-coffeshop',
    authDomain: 'api-coffeshop.firebaseapp.com',
    databaseURL: 'https://api-coffeshop-default-rtdb.firebaseio.com',
    storageBucket: 'api-coffeshop.appspot.com',
    measurementId: 'G-M85EZDP7EB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkLf7k29ejStj_OctBRf5jL7wn4rrj8MI',
    appId: '1:481070290258:android:5bd0e94606488d3ea8168b',
    messagingSenderId: '481070290258',
    projectId: 'api-coffeshop',
    databaseURL: 'https://api-coffeshop-default-rtdb.firebaseio.com',
    storageBucket: 'api-coffeshop.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-wqMWSVOWmWKWXJir6hrR3CiHJWgz0fw',
    appId: '1:481070290258:ios:742e815f53218054a8168b',
    messagingSenderId: '481070290258',
    projectId: 'api-coffeshop',
    databaseURL: 'https://api-coffeshop-default-rtdb.firebaseio.com',
    storageBucket: 'api-coffeshop.appspot.com',
    iosBundleId: 'com.example.coffeshop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-wqMWSVOWmWKWXJir6hrR3CiHJWgz0fw',
    appId: '1:481070290258:ios:fdbaece88b576818a8168b',
    messagingSenderId: '481070290258',
    projectId: 'api-coffeshop',
    databaseURL: 'https://api-coffeshop-default-rtdb.firebaseio.com',
    storageBucket: 'api-coffeshop.appspot.com',
    iosBundleId: 'com.example.coffeshop.RunnerTests',
  );
}
