import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBYWRs7IjBxr-oHLWhQIwnYQX99T3SahzU",
            authDomain: "notesapp-418e2.firebaseapp.com",
            projectId: "notesapp-418e2",
            storageBucket: "notesapp-418e2.appspot.com",
            messagingSenderId: "945273151444",
            appId: "1:945273151444:web:4d920839eafce2dab08041",
            measurementId: "G-1BCPWLTZQX"));
  } else {
    await Firebase.initializeApp();
  }
}
