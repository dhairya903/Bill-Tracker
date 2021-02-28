import 'package:bill_tracker/home.dart';
import 'package:bill_tracker/screens/homepage.dart';
import 'package:bill_tracker/screens/input_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF111328),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        accentColor: Color(0xFF4a4e69),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return Home();
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}