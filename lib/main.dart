import 'package:dubai_debremewy_app_dogs_food/firebase_options.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/authentication_repository.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();

//Initialize the Firebase then call the OnReady function from the AuthenticationRepository
    Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
    runApp(const MyChurchApp());
  }


class MyChurchApp extends StatelessWidget {
  const MyChurchApp({super.key});

  // This widget is the root of your application.
  @override


  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SafeArea(
        child: SplashScreen(),


        // If you dont want to see the splash screen
        // Replace the SplashScreen() with CircularProgressIndicator(),
      ),
    );
  }
}

