import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/otp_screen.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common_widgets/button_widgets.dart';
import '../../../../constants/color_strings.dart';
import '../../../../constants/image_strings.dart';
import 'package:get/get.dart';

import '../../../dashboard_screen/user_profile/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
        SignUpController()); // controller will have everything from the signUpController
    final _formKey = GlobalKey<FormState>(); // the key should be unique
    //bool isRegistered = false;
    //var _phoneNumber =controller.phoneNo.toString();
    String phoneNumber = '+971' + controller.phoneNo.text.trim();

    return SafeArea(
      child: Scaffold(
        backgroundColor: gtBackgroundColor,
        body: SingleChildScrollView(
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
            child: Form(
              // wrap it with form so we can identify it with a unique formKey
              key: _formKey,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(gtLoginImage),
                    SizedBox(height: 20.0),
                    Text(
                      'Welcome Back!',
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
                            'Please type your UAE Phone Number to SignUp',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
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
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              fillColor: Colors.white,
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
                          SizedBox(height: 20.0),
                          gtButton(
                            onTap: () {
                              if (controller.phoneNo.text.trim() == null ||
                                  controller.phoneNo.text.trim().isEmpty) {
                                setState(() {
                                  errorMessage =
                                      'Phone Number cant be empty, Please enter a valid Phone Number!';
                                });
                              } else if (controller.phoneNo.text
                                      .trim()
                                      .length !=
                                  9) {
                                setState(() {
                                  errorMessage =
                                      'Please enter a valid Phone Number!';
                                });
                              } else if (_formKey.currentState!.validate()) {
                                if (SignUpController.instance.signUserIn() ==
                                    false) {
                                   Get.to(() => OTPScreen());
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => OTPScreen()));
                                } else {
                                  setState(() {
                                    errorMessage =
                                        'No account with this Phone Number,\n please Register!';
                                  });
                                }
                                //SignUpController.instance.phoneAuthentication('+971586905908');
                                // Get.to(()=> OTPScreen());
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => OTPScreen(
                                //
                                //         ))
                                // );

                                //--------------------------------------
                                // check if the field in the text box is validated
                                // SignUpController.instance.phoneAuthentication(controller.phoneNo.text.trim());

//---------------------------------------
                              }
                            },
                            gtText: 'LOGIN',
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Not a member!',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10.0),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => SignUpScreen(),
                                      transition: Transition.fadeIn,
                                      duration: Duration(seconds: 1));
                                },
                                child: Text(
                                  'Register Now',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[800]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          errorMessage.isNotEmpty
                              ? Text(
                                  errorMessage,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
