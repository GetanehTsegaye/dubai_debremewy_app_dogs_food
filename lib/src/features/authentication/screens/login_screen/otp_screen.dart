import 'package:dubai_debremewy_app_dogs_food/src/common_widgets/button_widgets.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/authentication_repository.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/otp_controller.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/dashboard_screen/user_profile/signup_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';








class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otp;
    OTPController otpController = Get.put(OTPController());
    final phoneNo = TextEditingController().toString();
    var phoneNumber = AuthenticationRepository.instance.phoneAuthentication(phoneNo);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CO\nDE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 110.0,
                ),
              ),
              Text(
                'VERIFICATION',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 40.0),
              Text(
                'Enter the verification code that was sent to:' + ' +971' ,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),

              SizedBox(height: 20.0),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code){
                  otp =code;
                  //if the otp code is correct automatically redirect it to the Dashboard
                  //OTPController.instance.verifyOTP(otp);
                  otpController.verifyOTP(otp);
                }
              ),
              SizedBox(height: 20.0),
              gtButton(
                onTap: (){
                  //Incase you have to type the OTP manually and need to hit Next button, this will redirect it to the next screen
                  otpController.verifyOTP(otp);
                  //OTPController.instance.verifyOTP(otp);
                  // Get.to(()=>  SignUpScreen(),
                  //     transition: Transition.rightToLeftWithFade,
                  //     duration: Duration(seconds: 2));
                },
                gtText: 'NEXT',
              )
            ],
          ),
        ),
      ),
    ));
  }
}
