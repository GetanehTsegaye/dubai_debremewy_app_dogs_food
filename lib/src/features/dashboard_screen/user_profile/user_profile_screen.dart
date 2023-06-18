import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common_widgets/button_widgets.dart';
import '../../../common_widgets/textfield_widgets.dart';
import '../../../constants/color_strings.dart';
import '../../../constants/image_strings.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late File _image; // Variable to store the selected image



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
    return Scaffold(
      backgroundColor: gtBackgroundColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset(
            gtRegScreenImage,
          ),
          // SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.only(
                top: 3.0, left: 10.0, right: 10.0, bottom: 15.0),
            child: Container(
              //height: MediaQuery.of(context).size.height * 0.52,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(gtBackgroundPaternImage),
                  // Replace with your pattern image path
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.8),
                    // Adjust opacity as needed
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Text(
                      'Build Your Profile Here!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),

                    // +++ Profile Picture Upload
                    Center(
                      child: uploadPhoto(context),
                    ),

                    //--- Profile Picture Upload


                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          // Basic Info
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              child: ExpansionTile(
                                collapsedBackgroundColor: Colors.black,
                                collapsedTextColor: Colors.white,
                                collapsedIconColor: Colors.white,
                                backgroundColor: Colors.grey,
                                textColor: Colors.black,
                                iconColor: Colors.black,
                                title: Text('BASIC INFO'),
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage(gtBackgroundPaternImage),
                                        // Replace with your pattern image path
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.8),
                                          // Adjust opacity as needed
                                          BlendMode.dstATop,
                                        ),
                                        repeat: ImageRepeat
                                            .repeat, // Set repeat mode for the pattern
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
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
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),

                          //For Church use only

                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              child: ExpansionTile(
                                collapsedBackgroundColor: Colors.black,
                                collapsedTextColor: Colors.white,
                                collapsedIconColor: Colors.white,
                                backgroundColor: Colors.grey,
                                textColor: Colors.black,
                                iconColor: Colors.black,
                                title: Text('FOR CHURHC USE ONLY'),
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                        AssetImage(gtBackgroundPaternImage),
                                        // Replace with your pattern image path
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.8),
                                          // Adjust opacity as needed
                                          BlendMode.dstATop,
                                        ),
                                        repeat: ImageRepeat
                                            .repeat, // Set repeat mode for the pattern
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        gtTextField(
                                          gtHintText: 'የክርስትና ስም',
                                          gtPrefixIcon: Icon(
                                            Icons.person_add_outlined,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        gtTextField(
                                          gtHintText: 'የንስሃ አባት',
                                          gtPrefixIcon: Icon(
                                            Icons.person_add_outlined,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        gtTextField(
                                          gtHintText:
                                          'Are you a memeber of any Tsiwa Mahiber in our church??',
                                          gtPrefixIcon: Icon(
                                            Icons.question_mark,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        gtTextField(
                                          gtHintText: 'Select your Tsiwa Mahiber?',
                                          gtPrefixIcon: Icon(
                                            Icons.fact_check,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),


                          SizedBox(height: 10.0),

                          //Community

                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              child: ExpansionTile(
                                collapsedBackgroundColor: Colors.black,
                                collapsedTextColor: Colors.white,
                                collapsedIconColor: Colors.white,
                                backgroundColor: Colors.grey,
                                textColor: Colors.black,
                                iconColor: Colors.black,
                                title: Text('COMMUNITY'),
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                        AssetImage(gtBackgroundPaternImage),
                                        // Replace with your pattern image path
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.8),
                                          // Adjust opacity as needed
                                          BlendMode.dstATop,
                                        ),
                                        repeat: ImageRepeat
                                            .repeat, // Set repeat mode for the pattern
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        gtTextField(
                                          gtHintText: 'Profession',
                                          gtPrefixIcon: Icon(
                                            Icons.work,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        gtTextField(
                                          gtHintText: 'Do you have a UAE resident visa?',
                                          gtPrefixIcon: Icon(
                                            Icons.fact_check,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        gtTextField(
                                          gtHintText: 'Where do you live??',
                                          gtPrefixIcon: Icon(
                                            Icons.question_mark,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        gtTextField(
                                          gtHintText: 'Which Area?',
                                          gtPrefixIcon: Icon(
                                            Icons.fact_check,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.only(
                 left: 10.0, right: 10.0,),
            child: gtButton(
              onTap: (){},
              gtText: 'UPDATE',
            ),
          ),
          SizedBox(height: 20.0),
        ],
      )),
    );
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
    );
  }
}





