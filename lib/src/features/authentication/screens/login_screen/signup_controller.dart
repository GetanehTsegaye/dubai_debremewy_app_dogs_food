

import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/models/user_model.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/authentication_repository.dart';
import 'package:dubai_debremewy_app_dogs_food/src/repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // Textfield Controllers to get data from TextFields
  final phoneNo = TextEditingController();
  final userRepo = Get.put(UserRepository());

  // Call this function from Design
  void phoneAuthentication() {
    // Retrieve the text value from the TextEditingController
    final phoneNumber = phoneNo.text;

    // Validate the phone number if necessary
    // ...

    // Call the Authentication Repository to create the user with the phone number

    AuthenticationRepository.instance.phoneAuthentication('+971$phoneNumber');


  }
  Future<void> createUser(UserModel user) async {
   await userRepo.createUser(user);
   phoneAuthentication();
  }



Future signUserIn() async {
  bool hasError = false;
  String userName ='';
  final phoneNumber = phoneNo.text;
  final _userRepo = Get.put(UserRepository());
 // UserModel? user = await _userRepo.getUserByPhoneNumber(phoneNumber);
  try{
    UserModel? user = await _userRepo.getUserByPhoneNumber('+971$phoneNumber');
    userName = user.fullName;
  //phoneAuthentication();
  }
  catch(e){
    Get.snackbar("Error", "Please Register");
    if(e.toString().trim() =="Bad state: No element")
      {
        // the user does not exist
        hasError = true;
      }
    else
      {print(e.toString());}


  }
  if (!hasError && userName!='') {
    phoneAuthentication();
    Get.to(() => OTPScreen());

  }
return hasError;
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