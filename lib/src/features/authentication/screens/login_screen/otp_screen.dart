import 'package:dubai_debremewy_app_dogs_food/src/common_widgets/button_widgets.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/authentication_repository.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/otp_controller.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/dashboard_screen/user_profile/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../constants/image_strings.dart';








class OTPScreen extends StatelessWidget {
   OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otp;
 //   final user = FirebaseAuth.instance.currentUser;
    OTPController otpController = Get.put(OTPController());
    //final phoneNo = TextEditingController().toString();
   // var phoneNumber = AuthenticationRepository.instance.phoneAuthentication(phoneNo);

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(gtBackgroundPaternImage),
              // Replace with your pattern image path
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), // Adjust opacity as needed
                BlendMode.dstATop,
              ),
              repeat: ImageRepeat.repeat, // Set repeat mode for the pattern
            ),
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes the position of the shadow
              ),
            ],
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 1.0,
            ),
          ),
          height: MediaQuery.of(context).size.height ,
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
                '',
                //'Enter the verification code that was sent to:  ${user?.phoneNumber!}' ,
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
