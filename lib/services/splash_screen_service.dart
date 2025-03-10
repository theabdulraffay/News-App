import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/sign_up_screen.dart';

class SplashScreenService {
  SplashScreenService({required this.context});
  BuildContext context;
  final instance = FirebaseAuth.instance;

  Future<void> getCurrentuser() async {
    instance.authStateChanges().listen((d) {
      if (d != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (builder) => HomeScreen()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (builder) => SignUpScreen()),
        );
      }
    });
  }
}
