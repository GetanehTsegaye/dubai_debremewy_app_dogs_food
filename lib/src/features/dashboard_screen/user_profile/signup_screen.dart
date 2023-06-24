//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import '../../../common_widgets/button_widgets.dart';
import '../../../common_widgets/radio_button_widgets.dart';
import '../../../common_widgets/textfield_widgets.dart';
import '../../../constants/image_strings.dart';
import '../dashboard_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late File _image; // Variable to store the selected image
  final user = FirebaseAuth.instance.currentUser;

  final _fullNameController = TextEditingController();
  final _genderController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _maritalStatusController = TextEditingController();
  final _churchLocationController = TextEditingController();

  final List<String> churchCountyList = [
    'Abu Dhabi',
    'Dubai',
    'Sharjah',
    'Ajman',
    'Umm Al Quwain',
    'Ras Al Khaimah',
    'Fujairah',
  ];
  String selectedCountry = 'Dubai';
  int selectedGender = 0;

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


  Future signUp() async{

    // // The following will create a userProfiles collection in the database if it is not already created in the firebase
    // await FirebaseFirestore.instance.collection('userProfiles').add({
    //   'Full Name':_fullNameController.text.trim(),
    //   'Gender':_genderController.text,
    //   'Email':_emailController.text.trim(),
    //   'Phone Number':user?.phoneNumber!.toString(),
    //   'Maritial Status':_maritalStatusController,
    //   'Church Location':_churchLocationController
    //
    // });

    Get.to(() => DashboardScreen(),
        transition: Transition.rightToLeftWithFade,
        duration: Duration(seconds: 2));
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
                      child: uploadPhoto(context),
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
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          gtTextField(
                            gtController: _fullNameController,
                            gtHintText: 'Full Name',
                            gtPrefixIcon: Icon(
                              Icons.person_outline_rounded,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          gtCustomRadioButtonWidget(
                            fieldName: 'Gender',
                            option1: 'Male',
                            option2: 'Female',
                            icon1: Icons.man,
                            icon2: Icons.woman,
                          ),

                          SizedBox(height: 5.0),
                          gtTextField(
                            gtController: _emailController,
                            gtHintText: 'Email',
                            gtPrefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone_outlined,
                                  color: Colors.grey,
                                ),
                                hintText: user?.phoneNumber!.toString(),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                fillColor: Colors.white,
                                filled: true),
                          ),
                          SizedBox(height: 5.0),
                          gtCustomRadioButtonWidget(
                            fieldName: 'Maritial Status',
                            option1: 'Single',
                            option2: 'Married',
                            icon1: Icons.person,
                            icon2: Icons.people,
                          ),
                          SizedBox(height: 10.0),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Select your Church\'s Location', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),)),
                          SizedBox(height: 5.0),
                          Container(
                            padding:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 5, bottom: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(color: Colors.grey.shade300 ),
                            ),
                            child: Row(

                              children: [
                                Expanded(
                                  flex:1,
                                  child: Icon(
                                    Icons.church_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 15.0),
                                Expanded(
                                  flex: 9,
                                  child: DropdownButton<String>(
                                    value: selectedCountry,
                                    onChanged: (String? newValue) {
                                      if (newValue != null) {
                                        setState(() {
                                          selectedCountry = newValue; // Update the selected country
                                        });
                                      }
                                    },
                                    items: churchCountyList.map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                    underline: Container(height: 0, color: Colors.white),

                                  ),
                                ),
                              ],
                            )
                          ),

                          SizedBox(height: 30.0),
                          gtButton(
                            onTap: signUp,
                            gtText: 'SIGN UP',
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

  GestureDetector uploadPhoto(BuildContext context) {
    return GestureDetector(
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
                    getImage(ImageSource.camera); // Open camera to take a photo
                    Navigator.of(context).pop();
                  },
                ),
                SimpleDialogOption(
                  child: Text('Pick from gallery'),
                  onPressed: () {
                    getImage(
                        ImageSource.gallery); // Open gallery to choose a photo
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
                  image: FileImage(_image), // Display the selected image
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
    );
  }
}
