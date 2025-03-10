import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/services/splash_screen_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      SplashScreenService(context: context).getCurrentuser,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('This is Splash Screen')));
  }
}
