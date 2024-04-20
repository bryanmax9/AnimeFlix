import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBWdzKVBF4MqXUd55sNA6k--yhG90EVSkc",
            authDomain: "tinderformovies-39053.firebaseapp.com",
            projectId: "tinderformovies-39053",
            storageBucket: "tinderformovies-39053.appspot.com",
            messagingSenderId: "207045557894",
            appId: "1:207045557894:web:8b06ab4bff0398f5821b07"));
  } else {
    await Firebase.initializeApp();
  }
}
