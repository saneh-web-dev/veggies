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
    apiKey: 'AIzaSyDEa13_aeNfFWeHxHdY6cVXDYq0BibVmFo',
    appId: '1:452360256379:web:5245d08d7a5f9f857f5bde',
    messagingSenderId: '452360256379',
    projectId: 'veggies-824e4',
    authDomain: 'veggies-824e4.firebaseapp.com',
    storageBucket: 'veggies-824e4.appspot.com',
    measurementId: 'G-HX1VE29ZW2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDECbtb1McxSfYXXjFnHBNNNUrE21A5gL4',
    appId: '1:452360256379:android:3bf9e98d03565e2b7f5bde',
    messagingSenderId: '452360256379',
    projectId: 'veggies-824e4',
    storageBucket: 'veggies-824e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCkUJXLVd6etQo8zo4PUZ0XEfk-bdBCfKg',
    appId: '1:452360256379:ios:ce9ea6d674cd4e347f5bde',
    messagingSenderId: '452360256379',
    projectId: 'veggies-824e4',
    storageBucket: 'veggies-824e4.appspot.com',
    androidClientId: '452360256379-cr524j4oi0ba6odvoe7cmb2urajt9mkp.apps.googleusercontent.com',
    iosClientId: '452360256379-uo1gsdgfoh9n9hmm97g6mrikp900m4so.apps.googleusercontent.com',
    iosBundleId: 'com.example.veggies',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCkUJXLVd6etQo8zo4PUZ0XEfk-bdBCfKg',
    appId: '1:452360256379:ios:ce9ea6d674cd4e347f5bde',
    messagingSenderId: '452360256379',
    projectId: 'veggies-824e4',
    storageBucket: 'veggies-824e4.appspot.com',
    iosClientId: '452360256379-uo1gsdgfoh9n9hmm97g6mrikp900m4so.apps.googleusercontent.com',
    iosBundleId: 'com.example.veggies',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDEa13_aeNfFWeHxHdY6cVXDYq0BibVmFo',
    appId: '1:452360256379:web:a4c5fdc9df1ffb187f5bde',
    messagingSenderId: '452360256379',
    projectId: 'veggies-824e4',
    authDomain: 'veggies-824e4.firebaseapp.com',
    storageBucket: 'veggies-824e4.appspot.com',
    measurementId: 'G-J8MZLJ4GXC',
  );

}