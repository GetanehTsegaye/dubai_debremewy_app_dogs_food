import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyChurchApp());
}

class MyChurchApp extends StatelessWidget {
  const MyChurchApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: SafeArea(
        child: SplashScreen(),
      ),
    );
  }
}

