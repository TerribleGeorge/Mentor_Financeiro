import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAb2ar5SCQEq3VlK5GGaaWdR4WvHgOlS00',
    appId: '1:841128243215:web:3d956f69bcfb67d12ef37a',
    messagingSenderId: '841128243215',
    projectId: 'mentorfinanceiro',
    authDomain: 'mentorfinanceiro.firebaseapp.com',
    storageBucket: 'mentorfinanceiro.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAb2ar5SCQEq3VlK5GGaaWdR4WvHgOlS00',
    appId: '1:841128243215:android:3d956f69bcfb67d12ef37a',
    messagingSenderId: '841128243215',
    projectId: 'mentorfinanceiro',
    storageBucket: 'mentorfinanceiro.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAb2ar5SCQEq3VlK5GGaaWdR4WvHgOlS00',
    appId: '1:841128243215:ios:3d956f69bcfb67d12ef37a',
    messagingSenderId: '841128243215',
    projectId: 'mentorfinanceiro',
    storageBucket: 'mentorfinanceiro.firebasestorage.app',
    iosClientId: '841128243215-abcdef.apps.googleusercontent.com',
    iosBundleId: 'com.example.mentor_financeiro',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAb2ar5SCQEq3VlK5GGaaWdR4WvHgOlS00',
    appId: '1:841128243215:macos:3d956f69bcfb67d12ef37a',
    messagingSenderId: '841128243215',
    projectId: 'mentorfinanceiro',
    storageBucket: 'mentorfinanceiro.firebasestorage.app',
    iosClientId: '841128243215-abcdef.apps.googleusercontent.com',
    iosBundleId: 'com.example.mentor_financeiro',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAb2ar5SCQEq3VlK5GGaaWdR4WvHgOlS00',
    appId: '1:841128243215:windows:3d956f69bcfb67d12ef37a',
    messagingSenderId: '841128243215',
    projectId: 'mentorfinanceiro',
    storageBucket: 'mentorfinanceiro.firebasestorage.app',
  );
}
