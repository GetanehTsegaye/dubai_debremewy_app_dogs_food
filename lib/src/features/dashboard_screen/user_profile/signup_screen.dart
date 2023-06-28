import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import '../../../common_widgets/button_widgets.dart';
import '../../../common_widgets/radio_button_widgets.dart';
import '../../../common_widgets/textfield_widgets.dart';
import '../../../constants/image_strings.dart';
import '../../authentication/screens/login_screen/login_screen.dart';
import '../../authentication/screens/login_screen/otp_screen.dart';
import '../../authentication/screens/login_screen/signup_controller.dart';
import '../dashboard_screen.dart';

// for the image
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late File _image; // Variable to store the selected image
  final user = FirebaseAuth.instance.currentUser;
  String errorMessage = '';
  final _fullNameController = TextEditingController();
  int _genderController = 0;
  //final _emailController = TextEditingController();
  String _phoneNumberController ='';
  int _maritalStatusController = 0;
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
// Function to upload an image to Firebase Storage
  Future<String> uploadImageToFirebase(File imageFile) async {
    String fileName = path.basename(imageFile.path);
    firebase_storage.Reference storageRef =
    firebase_storage.FirebaseStorage.instance.ref().child(fileName).child('id');
    firebase_storage.UploadTask uploadTask = storageRef.putFile(imageFile);
    firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }
  void RegisterUser() {
    final user = UserModel(
        fullName: _fullNameController.text.trim(),
        gender: _genderController,
        phoneNo: _phoneNumberController,
        maritalStatus: _maritalStatusController,
        churchLocation: selectedCountry);
    SignUpController.instance.createUser(user);
    Get.to(() => OTPScreen(),
        transition: Transition.rightToLeftWithFade,
        duration: Duration(seconds: 2));
  }
  Future signUp() async{
// Upload image to Firebase Storage

    // The following will create a userProfiles collection in the database if it is not already created in the firebase
    try{


      SignUpController.instance.phoneAuthentication();
      Get.to(() => OTPScreen(),
          transition: Transition.rightToLeftWithFade,
          duration: Duration(seconds: 2));


            await FirebaseFirestore.instance.collection('userProfiles').add({
              'Full Name': _fullNameController.text.trim(),
              'Gender':_genderController,
              // 'Email': _emailController.text.trim(),
              'Phone Number': _phoneNumberController,
              'Maritial Status':_maritalStatusController,
              'Church Location': selectedCountry,
              // 'Profile Picture URL': profilePicURL, // Save the image URL
            });

    }
    catch(e){
      print(e.toString());
    }

  }


  @override
  void initState() {
    super.initState();
    _image = File(''); // Provide an initial empty file to avoid null errors
  }
  void handleSelectedGender(int index) {
   setState(() {
     _genderController = index;
   });

  }
  void handleSelectedStatus(int index) {

    setState(() {
      _maritalStatusController = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
        SignUpController());
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Container(

            child: Column(
              children: [
                //Image.asset(gtRegistrationImage),
                Image.asset(gtRegScreenImage),
                Text(
                  'Welcome!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' Build Your Profile to get started!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 5.0),
                      // Center(
                      //   child: uploadPhoto(context),
                      // ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            //SizedBox(height: 20.0),


                            gtTextField(
                              gtController: _fullNameController,
                              gtHintText: 'Full Name',
                              gtPrefixIcon: Icon(
                                Icons.person_outline_rounded,
                                color: Colors.grey,
                              ),
                            ),
                            //SizedBox(height: 5.0),
                            gtCustomRadioButtonWidget(
                              fieldName: 'Gender',
                              option1: 'Male',
                              option2: 'Female',
                              icon1: Icons.man,
                              icon2: Icons.woman,
                              onChanged: handleSelectedGender,
                            ),

                            SizedBox(height: 5.0),
                            // gtTextField(
                            //   gtController: _emailController,
                            //   gtHintText: 'Email',
                            //   gtPrefixIcon: Icon(
                            //     Icons.email_outlined,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                            SizedBox(height: 5.0),
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
                                  borderSide: BorderSide(color: Colors.grey.shade300),
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
                            //SizedBox(height: 5.0),
                            gtCustomRadioButtonWidget(
                              fieldName: 'Maritial Status',
                              option1: 'Single',
                              option2: 'Married',
                              icon1: Icons.person,
                              icon2: Icons.people,
                                onChanged: handleSelectedStatus,
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

                            SizedBox(height: 20.0),

                            errorMessage.isNotEmpty?Text(
                              errorMessage,
                              style: TextStyle(color:  Colors.red, fontSize: 16, ),
                            ): SizedBox(),
                            gtButton(
                              onTap: (){

                                errorMessage ='';
                                if(_fullNameController.text.trim().isEmpty ) {
                                  setState(() {
                                    errorMessage = '- Full Name is required \n';
                                  });
                                }
                                if(_genderController==0) {
                                  setState(() {
                                    errorMessage = errorMessage + '- Gender is required \n';
                                  });
                                }
                                if(_maritalStatusController== 0 ) {
                                  setState(() {
                                    errorMessage = errorMessage +'- Marital Status is required \n';
                                  });
                                }
                                 if (controller.phoneNo.text.trim().length != 9) {
                                  setState(() {
                                    errorMessage =
                                        errorMessage + '- Please enter a valid Phone Number!';
                                  });
                                } else
                                  {
                                    _phoneNumberController ='+971'+controller.phoneNo.text.trim();
                                  }
                                 if(errorMessage.isEmpty ) {
                                   //signUp();
                                   RegisterUser();
                                 }
                              },
                              gtText: 'REGISTER',
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'I am already a member!',
                                  style: TextStyle(
                                      fontSize: 16.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 10.0),
                                GestureDetector(
                                  onTap: (){
                                    Get.to(() => LoginScreen(),
                                        transition: Transition.fadeIn,
                                        duration: Duration(seconds: 1));
                                  },
                                  child: Text(
                                    'LogIn now',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[800]),
                                  ),
                                ),
                              ],
                            ),

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
        width: 100,
        height: 100,
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
