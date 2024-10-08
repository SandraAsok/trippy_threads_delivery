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
    apiKey: 'AIzaSyAmh67bQzah0g_bQNLtkknovPX5oafll7Q',
    appId: '1:1076832854030:web:fc0f75281edf4b82cd9c5f',
    messagingSenderId: '1076832854030',
    projectId: 'trippythreads-a1ecb',
    authDomain: 'trippythreads-a1ecb.firebaseapp.com',
    storageBucket: 'trippythreads-a1ecb.appspot.com',
    measurementId: 'G-7FSG7MGVFE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDIDlthmTiKE284XJUmFuLpKiucyty3p0E',
    appId: '1:1076832854030:android:83b29cf3ee44a63ecd9c5f',
    messagingSenderId: '1076832854030',
    projectId: 'trippythreads-a1ecb',
    storageBucket: 'trippythreads-a1ecb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4SqbTSKpgMhpHJhk9kON-BIt1VHxk4P4',
    appId: '1:1076832854030:ios:4598dad7a950a9cacd9c5f',
    messagingSenderId: '1076832854030',
    projectId: 'trippythreads-a1ecb',
    storageBucket: 'trippythreads-a1ecb.appspot.com',
    iosBundleId: 'com.example.trippyThreadsDelivery',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4SqbTSKpgMhpHJhk9kON-BIt1VHxk4P4',
    appId: '1:1076832854030:ios:4598dad7a950a9cacd9c5f',
    messagingSenderId: '1076832854030',
    projectId: 'trippythreads-a1ecb',
    storageBucket: 'trippythreads-a1ecb.appspot.com',
    iosBundleId: 'com.example.trippyThreadsDelivery',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAmh67bQzah0g_bQNLtkknovPX5oafll7Q',
    appId: '1:1076832854030:web:b197993af520128acd9c5f',
    messagingSenderId: '1076832854030',
    projectId: 'trippythreads-a1ecb',
    authDomain: 'trippythreads-a1ecb.firebaseapp.com',
    storageBucket: 'trippythreads-a1ecb.appspot.com',
    measurementId: 'G-X9QXVHNW55',
  );
}
