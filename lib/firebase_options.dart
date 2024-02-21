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
    apiKey: 'AIzaSyCxRZUS2Hk6wOBwALHAFwWm3akHA7cJRZ0',
    appId: '1:386412573702:web:42b42c53b438c8f30dff87',
    messagingSenderId: '386412573702',
    projectId: 'zlands-final-year-project',
    authDomain: 'zlands-final-year-project.firebaseapp.com',
    storageBucket: 'zlands-final-year-project.appspot.com',
    measurementId: 'G-0ZZ46J577T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA5YAqGudFTTS9kEj_Y6NcVAJxBgJXP0tc',
    appId: '1:386412573702:android:79beeaf38dd7f0d10dff87',
    messagingSenderId: '386412573702',
    projectId: 'zlands-final-year-project',
    storageBucket: 'zlands-final-year-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyANtnl47DjriAj8nJqTsILdf5DbR_XmR7M',
    appId: '1:386412573702:ios:bf081a8e151ea1180dff87',
    messagingSenderId: '386412573702',
    projectId: 'zlands-final-year-project',
    storageBucket: 'zlands-final-year-project.appspot.com',
    androidClientId: '386412573702-j8lvcufa2f8fbh5ad2n580np9tldch5d.apps.googleusercontent.com',
    iosClientId: '386412573702-li9uqrffphuakj0bovpqb7k0su06armt.apps.googleusercontent.com',
    iosBundleId: 'com.example.zlandsfrontend',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyANtnl47DjriAj8nJqTsILdf5DbR_XmR7M',
    appId: '1:386412573702:ios:a5b8b34a1251e6020dff87',
    messagingSenderId: '386412573702',
    projectId: 'zlands-final-year-project',
    storageBucket: 'zlands-final-year-project.appspot.com',
    androidClientId: '386412573702-j8lvcufa2f8fbh5ad2n580np9tldch5d.apps.googleusercontent.com',
    iosClientId: '386412573702-cn76h9pq929ismk41ibj3hep3lmdrc62.apps.googleusercontent.com',
    iosBundleId: 'com.example.zlandsfrontend.RunnerTests',
  );
}
