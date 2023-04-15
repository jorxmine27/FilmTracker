import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCnMJmRiqFyfBw8ho-rzlPcYYQSsgPj0LI",
            authDomain: "filmtracker-a490d.firebaseapp.com",
            projectId: "filmtracker-a490d",
            storageBucket: "filmtracker-a490d.appspot.com",
            messagingSenderId: "362229846944",
            appId: "1:362229846944:web:0d7dd71a819b1fb7630ac5"));
  } else {
    await Firebase.initializeApp();
  }
}
