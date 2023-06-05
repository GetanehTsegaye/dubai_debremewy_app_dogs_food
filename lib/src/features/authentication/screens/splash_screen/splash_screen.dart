import 'package:flutter/material.dart';

import '../../../../constants/color_strings.dart';
import '../../../../constants/image_strings.dart';
import '../login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToLoginScreen();
  }

  Future<void> navigateToLoginScreen() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
      context as BuildContext,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: gtBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(gtSplashLightGif)),
          ],
        ),
      ),
    ));
  }
}
