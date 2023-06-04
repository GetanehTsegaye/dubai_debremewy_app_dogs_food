import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(


      home: SafeArea(
        child: SplashScreen(),
      ),
    );
  }
}

