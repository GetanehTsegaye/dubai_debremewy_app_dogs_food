
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:image_picker/image_picker.dart';


import 'dart:io';

import '../../common_widgets/button_widgets.dart';
import '../../common_widgets/textfield_widgets.dart';
import '../dashboard_screen/dashboard_screen.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  late File _image; // Variable to store the selected image

  final List<String> items = ['Abu Dhabi', 'Dubai', 'Sharjah', 'Umm Al-Quwain', 'Fujairah'];
  String selectedItem = 'Dubai';

  Future getImage(ImageSource source) async {
    try {
      var image = await ImagePicker().pickImage(source: source);

      if (image != null) {
        setState(() {
          _image = File(image.path); // Update the selected image
        });
      }
    } catch (e) {
      // Handle the error case when the user denies access to the gallery or camera
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to pick an image.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _image = File(''); // Provide an initial empty file to avoid null errors
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //Image.asset(gtRegistrationImage),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 40.0),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SimpleDialog(
                                title: Text('Choose an option'),
                                children: [
                                  SimpleDialogOption(
                                    child: Text('Take a photo'),
                                    onPressed: () {
                                      getImage(ImageSource
                                          .camera); // Open camera to take a photo
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  SimpleDialogOption(
                                    child: Text('Pick from gallery'),
                                    onPressed: () {
                                      getImage(ImageSource
                                          .gallery); // Open gallery to choose a photo
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                            image: _image.path.isNotEmpty
                                ? DecorationImage(
                              image: FileImage(
                                  _image), // Display the selected image
                              fit: BoxFit.cover,
                            )
                                : null,
                          ),
                          child: _image.path.isEmpty
                              ? Icon(
                            Icons.camera_alt,
                            size: 60,
                            color: Colors.grey[600],
                          )
                              : null,
                        ),
                      ),
                    ),
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
                              Icons.phone_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          gtTextField(
                            gtHintText: '+971-12-345-6789',
                            gtPrefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Expanded(child: Text('Select your Church')),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: selectedItem,
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      selectedItem = newValue;
                                    }
                                  },
                                  items: items.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          gtButton(
                            onTap: (){
                              Get.to(()=>  DashboardScreen(),
                                  transition: Transition.rightToLeftWithFade,
                                  duration: Duration(seconds: 2));
                            },
                            gtText: 'REGISTER',
                          ),
                          SizedBox(height: 20.0),

                        ],
                      ),
                    )
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



