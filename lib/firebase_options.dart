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
    apiKey: 'AIzaSyBsYpNCPB2HY_HYmhc8x0stR8gvBgRDurA',
    appId: '1:808707586267:web:9f250335321a03e158f4fe',
    messagingSenderId: '808707586267',
    projectId: 'sehatyaab-6d024',
    authDomain: 'sehatyaab-6d024.firebaseapp.com',
    storageBucket: 'sehatyaab-6d024.appspot.com',
    measurementId: 'G-6ZWWVBDJ4M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeD8-dwC-HfW1mhZTdNaBvO4thXMdN6yg',
    appId: '1:808707586267:android:c437171c8745e09e58f4fe',
    messagingSenderId: '808707586267',
    projectId: 'sehatyaab-6d024',
    storageBucket: 'sehatyaab-6d024.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYz9hViW3ea-GDDwE05m5D-3zs30fqFdY',
    appId: '1:808707586267:ios:d51fb597bb6e56e258f4fe',
    messagingSenderId: '808707586267',
    projectId: 'sehatyaab-6d024',
    storageBucket: 'sehatyaab-6d024.appspot.com',
    iosBundleId: 'com.example.sehatYaab',
  );
}