
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/otp_screen.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common_widgets/button_widgets.dart';
import '../../../../constants/color_strings.dart';
import '../../../../constants/image_strings.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignUpController()); // controller will have everything from the signUpController
    final _formKey = GlobalKey<FormState>(); // the key should be unique
    //bool isRegistered = false;
    var _phoneNumber =controller.phoneNo.toString();



    return SafeArea(
      child: Scaffold(
        backgroundColor: gtBackgroundColor,
        body: SingleChildScrollView(
          child: Form(  // wrap it with form so we can identify it with a unique formKey
            key: _formKey,
            child: Container(
              // height: MediaQuery.of(context).size.height,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage(gtBackgroundPaternImage),
              //     // Replace with your pattern image path
              //     fit: BoxFit.cover,
              //     colorFilter: ColorFilter.mode(
              //       Colors.black.withOpacity(0.8), // Adjust opacity as needed
              //       BlendMode.dstATop,
              //     ),
              //     repeat: ImageRepeat.repeat, // Set repeat mode for the pattern
              //   ),
              //   color: Colors.white,
              //   borderRadius: BorderRadius.all(
              //     Radius.circular(20.0),
              //   ),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey.withOpacity(0.5),
              //       spreadRadius: 2,
              //       blurRadius: 5,
              //       offset: Offset(0, 3), // changes the position of the shadow
              //     ),
              //   ],
              //   border: Border.all(
              //     color: Colors.grey.withOpacity(0.5),
              //     width: 1.0,
              //   ),
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(gtLoginImage),
                  SizedBox(height: 20.0),
                  Text(
                    'Welcome!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 25.0),
                        Text(
                          'Please type your UAE Phone Number SignUp',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 40.0),
                        TextField(
                          controller: controller.phoneNo,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                            prefixText: '+971',

                            hintText: '     Phone Number',
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                            //enabled: false,
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(9),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 10.0),
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       flex: 3,
                        //       child: TextField(
                        //         decoration: InputDecoration(
                        //           hintText: '+971',
                        //           prefixIcon: Icon(
                        //             Icons.phone,
                        //             color: Colors.grey,
                        //           ),
                        //           border: OutlineInputBorder(),
                        //           enabledBorder: OutlineInputBorder(
                        //             borderSide: BorderSide(color: Colors.white),
                        //           ),
                        //           focusedBorder: OutlineInputBorder(
                        //             borderSide: BorderSide(color: Colors.grey),
                        //           ),
                        //           fillColor: Colors.grey.shade50,
                        //           filled: true,
                        //           enabled: false,
                        //          // contentPadding: EdgeInsets.only(right: 10.0),
                        //         ),
                        //         inputFormatters: [
                        //           LengthLimitingTextInputFormatter(9),
                        //           FilteringTextInputFormatter.digitsOnly,
                        //         ],
                        //         keyboardType: TextInputType.number,
                        //       ),
                        //     ),
                        //     SizedBox(width: 5.0),
                        //     Expanded(
                        //       flex: 8,
                        //       child: TextField(
                        //         decoration: InputDecoration(
                        //           hintText: 'Phone Number',
                        //           border: OutlineInputBorder(),
                        //           enabledBorder: OutlineInputBorder(
                        //             borderSide: BorderSide(color: Colors.white),
                        //           ),
                        //           focusedBorder: OutlineInputBorder(
                        //             borderSide: BorderSide(color: Colors.grey),
                        //           ),
                        //           fillColor: Colors.grey.shade50,
                        //           filled: true,
                        //         ),
                        //         inputFormatters: [
                        //           LengthLimitingTextInputFormatter(9),
                        //           FilteringTextInputFormatter.digitsOnly,
                        //         ],
                        //         keyboardType: TextInputType.number,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 20.0),
                        // gtButton(
                        //   onTap: (){
                        //     if(_formKey.currentState!.validate()){ // check if the field in the text box is validated
                        //
                        //       SignUpController.instance.signUserIn();
                        //       //SignUpController.instance.phoneAuthentication('+971586905908');
                        //       Get.to(()=> OTPScreen());
                        //     }
                        //   },
                        //   gtText: 'SIGN IN',
                        // ),
                        SizedBox(height: 20.0),
                      // Text(
                      //   isRegistered ? 'User is registered' : 'User is not registered',
                      //   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      // ),
                      //   SizedBox(height: 20.0),
                      //   Row(children: [
                      //     Expanded(
                      //       child: Divider(
                      //         thickness: 0.5,
                      //         color: Colors.grey.shade800,
                      //       ),
                      //     ),
                      //     Text('  OR  '),
                      //     Expanded(
                      //       child: Divider(
                      //         thickness: 0.5,
                      //         color: Colors.grey[400],
                      //       ),
                      //     ),
                      //   ]),
                      //   SizedBox(height: 20.0),
                        gtButton(
                          onTap: (){
                            if(_formKey.currentState!.validate()){ // check if the field in the text box is validated
                             // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                              SignUpController.instance.phoneAuthentication();
                              //SignUpController.instance.phoneAuthentication('+971586905908');
                              Get.to(()=> OTPScreen());
                            }
                          },
                          gtText: 'SIGN UP',
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('I am already a member!', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                            SizedBox(width: 10.0),
                            Text('SignIn now', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Colors.blue[800]),),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
