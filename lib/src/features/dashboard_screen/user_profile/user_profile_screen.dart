import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/controllers/profile_controller.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common_widgets/button_widgets.dart';
import '../../../common_widgets/radio_button_widgets.dart';
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
  // final _fullNameController = TextEditingController();
  // int _genderController = 0;
  // final _emailController = TextEditingController();
  // String _phoneNumberController = '';
  // int _maritalStatusController = 0;
  // int _churchLocationController = 0;

  final List<String> churchCountyList = [
    'Abu Dhabi',
    'Dubai',
    'Sharjah',
    'Ajman',
    'Umm Al Quwain',
    'Ras Al Khaimah',
    'Fujairah',
  ];

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
    final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: gtBackgroundColor,
      body: SingleChildScrollView(
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot){
              if(snapshot.connectionState==ConnectionState.done){
                //Data has been completly fetched
                if(snapshot.hasData){
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
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
                                                      gtInitialValue: userData.fullName,
                                                      gtHintText: 'Full Name',
                                                      gtPrefixIcon: Icon(
                                                        Icons.person_outline_rounded,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    //SizedBox(height: 5.0),

                                                    //----------------
                                                    // gtCustomRadioButtonWidget(
                                                    //   fieldName: 'Gender',
                                                    //   option1: 'Male',
                                                    //   option2: 'Female',
                                                    //   icon1: Icons.man,
                                                    //   icon2: Icons.woman,
                                                    //   onChanged: handleSelectedGender,
                                                    // ),

                                                    //-------------------------
                                                    SizedBox(height: 10.0),
                                                    gtTextField(
                                                     // gtController: _emailController,
                                                      gtHintText: 'Email',
                                                      gtPrefixIcon: Icon(
                                                        Icons.email_outlined,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.0),
                                                    TextFormField(
                                                      initialValue: userData.phoneNo,
                                                      decoration: InputDecoration(
                                                        prefixIcon: Icon(
                                                          Icons.phone,
                                                          color: Colors.grey,
                                                        ),
                                                        prefixText: '+971',

                                                        hintText: '     Phone Number',
                                                        border: OutlineInputBorder(),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey.shade300),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey),
                                                        ),
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        //enabled: false,
                                                      ),
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(9),
                                                        FilteringTextInputFormatter
                                                            .digitsOnly,
                                                      ],
                                                      keyboardType: TextInputType.number,
                                                    ),
                                                    //SizedBox(height: 5.0),


                                                    //-------------------------------
                                                    // gtCustomRadioButtonWidget(
                                                    //   fieldName: 'Maritial Status',
                                                    //   option1: 'Single',
                                                    //   option2: 'Married',
                                                    //   icon1: Icons.person,
                                                    //   icon2: Icons.people,
                                                    //   onChanged: handleSelectedStatus,
                                                    // ),
                                                    //-----------------------
                                                    SizedBox(height: 10.0),
                                                    Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          'Select your Church\'s Location',
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontWeight: FontWeight.bold),
                                                        )),
                                                    SizedBox(height: 5.0),
                                                    Container(
                                                        padding: EdgeInsets.only(
                                                            left: 20.0,
                                                            right: 20.0,
                                                            top: 5,
                                                            bottom: 5.0),
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                          BorderRadius.circular(6.0),
                                                          border: Border.all(
                                                              color: Colors.grey.shade300),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Icon(
                                                                Icons.church_outlined,
                                                                color: Colors.grey,
                                                              ),
                                                            ),
                                                            SizedBox(width: 15.0),
                                                            //---------------------------
                                                            // Expanded(
                                                            //   flex: 9,
                                                            //   child: DropdownButton<String>(
                                                            //     value:
                                                            //     _churchLocationController,
                                                            //     onChanged:
                                                            //         (String? newValue) {
                                                            //       if (newValue != null) {
                                                            //         setState(() {
                                                            //           _churchLocationController =
                                                            //               newValue; // Update the selected country
                                                            //         });
                                                            //       }
                                                            //     },
                                                            //     items: churchCountyList.map<
                                                            //         DropdownMenuItem<
                                                            //             String>>(
                                                            //             (String value) {
                                                            //           return DropdownMenuItem<
                                                            //               String>(
                                                            //             value: value,
                                                            //             child: Text(value),
                                                            //           );
                                                            //         }).toList(),
                                                            //     underline: Container(
                                                            //         height: 0,
                                                            //         color: Colors.white),
                                                            //   ),
                                                            // ),

                                                            //---------------------------------
                                                          ],
                                                        )),
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
                                                      gtHintText:
                                                      'Select your Tsiwa Mahiber?',
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
                                                      gtHintText:
                                                      'Do you have a UAE resident visa?',
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
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: gtButton(
                          onTap: () {},
                          gtText: 'UPDATE',
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  );
                }
                else{
                  return Center(child: Text(snapshot.error.toString()));
                }
              } else if(snapshot.hasError) {
                //Data is still being fetched
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text('Something went wrong'));
              }
            },

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
