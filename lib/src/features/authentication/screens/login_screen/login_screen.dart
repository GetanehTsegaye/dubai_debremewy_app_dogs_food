import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common_widgets/button_widgets.dart';
import '../../../../constants/color_strings.dart';
import '../../../../constants/image_strings.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void signUserIn() {
    Get.to(()=>  OTPScreen(),
    transition: Transition.rightToLeftWithFade,
    duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: gtBackgroundColor,
        body: SingleChildScrollView(
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
                      'Please type your Phone Number and hit SignIn if you already have an account or SignUp if you want to Register.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    TextField(
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
                    SizedBox(height: 20.0),
                    gtButton(
                      onTap: signUserIn,
                      gtText: 'SIGN IN',
                    ),
                    SizedBox(height: 20.0),
                    Row(children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Text('  OR  '),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ]),
                    SizedBox(height: 20.0),
                    gtButton(
                      onTap: signUserIn,
                      gtText: 'SIGN UP',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
