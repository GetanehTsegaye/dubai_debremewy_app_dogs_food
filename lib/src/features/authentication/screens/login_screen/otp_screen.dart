import 'package:dubai_debremewy_app_dogs_food/src/common_widgets/button_widgets.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/user_profile/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../dashboard_screen/dashboard_screen.dart';
import '../user_profile/reg_screen.dart';


class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                'Enter the verification code that was sent to:' + ' +971123456789',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
              ),
              SizedBox(height: 20.0),
              gtButton(
                onTap: (){
                  Get.to(()=>  RegistrationScreen(),
                      transition: Transition.rightToLeftWithFade,
                      duration: Duration(seconds: 2));
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
