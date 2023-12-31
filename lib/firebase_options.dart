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
    apiKey: 'AIzaSyDSSohjT8m9809WoplxYvYrxk0HV3qse20',
    appId: '1:399016012353:web:10b3989bdc4343c52b34c0',
    messagingSenderId: '399016012353',
    projectId: 'chatapp-6044f',
    authDomain: 'chatapp-6044f.firebaseapp.com',
    storageBucket: 'chatapp-6044f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAzpugAcGjI0RQpB0Di947EvcPgiQIWiKw',
    appId: '1:399016012353:android:72c807daf7895ffd2b34c0',
    messagingSenderId: '399016012353',
    projectId: 'chatapp-6044f',
    storageBucket: 'chatapp-6044f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFQtporMdmgywBbhKxZbQzCaNvpG0Eg78',
    appId: '1:399016012353:ios:dd4e6b928bd1888c2b34c0',
    messagingSenderId: '399016012353',
    projectId: 'chatapp-6044f',
    storageBucket: 'chatapp-6044f.appspot.com',
    iosBundleId: 'com.example.chatMessenger',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFQtporMdmgywBbhKxZbQzCaNvpG0Eg78',
    appId: '1:399016012353:ios:b3ea05434bc576812b34c0',
    messagingSenderId: '399016012353',
    projectId: 'chatapp-6044f',
    storageBucket: 'chatapp-6044f.appspot.com',
    iosBundleId: 'com.example.chatMessenger.RunnerTests',
  );
}
