
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // Textfield Controllers to get data from TextFields
  final phoneNo = TextEditingController();

  // Call this function from Design
  void phoneAuthentication() {
    // Retrieve the text value from the TextEditingController
    final phoneNumber = phoneNo.text;

    // Validate the phone number if necessary
    // ...

    // Call the Authentication Repository to create the user with the phone number

    AuthenticationRepository.instance.phoneAuthentication('+971$phoneNumber');


  }
void signUserIn(){
  final phoneNumber = phoneNo.text;
  AuthenticationRepository.instance.signUserIn('+971$phoneNumber');
}

}














// import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/authentication_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();
//
//   //Textfield Controllers to get data from TextFields
//   final phoneNo = TextEditingController();
//
//   //Call this function from Design
// void phoneAuthentication(String phoneNo){
// // we can do aditional validation here
//
// //Call the Authentication Repository to create the user with phone number
//
// AuthenticationRepository.instance.phoneAuthentication('+971'+phoneNo);
// //AuthenticationRepository authenticationRepository = Get.find<AuthenticationRepository>();
//
// }
// }