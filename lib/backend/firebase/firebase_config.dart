import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB-Dgki5-9Q_Ci2i5L9_YuH4wGReCgfxIo",
            authDomain: "event-photo-04072025.firebaseapp.com",
            projectId: "event-photo-04072025",
            storageBucket: "event-photo-04072025.appspot.com",
            messagingSenderId: "520447223276",
            appId: "1:520447223276:web:f21f4348f086e574e10cc9",
            measurementId: "G-CXQGER06H9"));
  } else {
    await Firebase.initializeApp();
  }
}
