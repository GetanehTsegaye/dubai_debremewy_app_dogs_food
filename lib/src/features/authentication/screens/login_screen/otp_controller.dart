import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/authentication_repository.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/dashboard_screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../dashboard_screen/user_profile/signup_screen.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();
  final user = FirebaseAuth.instance.currentUser;
  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
// If it isVerified then it will open the Dashboard otherwise it will go back to the previous screen
    //isVerified ? Get.offAll(const DashboardScreen()): Get.back();
    if(isVerified ==true){
      Get.offAll(DashboardScreen());

      // Get.to(()=>  SignUpScreen(),
      //     transition: Transition.rightToLeftWithFade,
      //     duration: Duration(seconds: 2));
    } else
      {
        Get.back();
      }
  }
}