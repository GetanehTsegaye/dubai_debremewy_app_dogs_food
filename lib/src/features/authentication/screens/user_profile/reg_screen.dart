import 'package:flutter/material.dart';

import '../../../../common_widgets/button_widgets.dart';
import '../../../../common_widgets/textfield_widgets.dart';
import '../../../../constants/image_strings.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image.asset(gtRegistrationImage),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [

                    SizedBox(height: 20.0),
                    Text(
                      'Build Your Profile to get started!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    gtTextField(
                      gtHintText: 'First Name',
                      gtPrefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    gtTextField(
                      gtHintText: 'Father\'s Name',
                      gtPrefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    gtTextField(
                      gtHintText: 'Christian\'s Name',
                      gtPrefixIcon: Icon(
                        Icons.person_add_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    gtTextField(
                      gtHintText: 'Gender',
                      gtPrefixIcon: Icon(
                        Icons.female,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    gtTextField(
                      gtHintText: 'Email',
                      gtPrefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    gtTextField(
                      gtHintText: 'Profession',
                      gtPrefixIcon: Icon(
                        Icons.work,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    gtButton(
                      onTap: (){},
                      gtText: 'NEXT',
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
