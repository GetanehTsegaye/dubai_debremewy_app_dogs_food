import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/controllers/profile_controller.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/models/user_model.dart';
import 'package:dubai_debremewy_app_dogs_food/src/repository/user_repository.dart';

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

// for the image
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:firebase_auth/firebase_auth.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late File _image; // Variable to store the selected image
  final user = FirebaseAuth.instance.currentUser;
  late final userPicURLController;
  // final _fullNameController = TextEditingController();
  //int _genderController = 0;
 // final _emailController = TextEditingController();
  bool isMember = false;

  // String _phoneNumberController = '';
  // int _maritalStatusController = 0;
  //String _churchLocationController = '';
  String selectedCountry = '';
  String selectedAnswer = '';
  final List<String> churchCountyList = [
    'Abu Dhabi',
    'Dubai',
    'Sharjah',
    'Ajman',
    'Umm Al Quwain',
    'Ras Al Khaimah',
    'Fujairah',
  ];
  final List<String> unionList = [
    'መድሃኒዓለም',
    'ቅዱስ ሚካኤል',
    'ኪዳነምህረት ',
  ];

  String selectedUnion = 'መድሃኒዓለም';

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
    firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child(fileName)
        .child('id');
    firebase_storage.UploadTask uploadTask = storageRef.putFile(imageFile);
    firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    return imageUrl;
  }
// Fetch Image



  @override
  void initState() {
    super.initState();
    _image = File(''); // Provide an initial empty file to avoid null errors

  }

  void handleSelectedGender(int index) {
    setState(() {
      //_genderController = index;
    });
  }

  void handleSelectedStatus(int index) {
    setState(() {
      // _maritalStatusController = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profController = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: gtBackgroundColor,
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: profController.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //Data has been completly fetched
            if (snapshot.hasData) {
              UserModel userData = snapshot.data as UserModel;

              //Controllers
              final userfullNameController =
                  TextEditingController(text: userData.fullName);

            //  userPicURLController =TextEditingController(text:userData.profilePicutreUrl);
              final genderController =TextEditingController(text: userData.gender.toString());
              final phoneNoController = TextEditingController(text:userData.phoneNo);
              final maritalStatusController = TextEditingController(text:userData.maritalStatus.toString());
              final churchLocationController = TextEditingController(text:userData.churchLocation);

              final emailController = TextEditingController(text:userData.email);
              final christianNameController = TextEditingController(text:userData.christianName);
              final spiritualFathersNameController = TextEditingController(text:userData.spiritualFathersName);
              final mahiberNameController = TextEditingController(text:userData.mahiberName);
              final educationalLevelController = TextEditingController(text:userData.educationalLevel);
              final occupationTypeController = TextEditingController(text:userData.occupationType);
              final visaTypeController = TextEditingController(text:userData.visaType);


              return Form(
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
                            repeat: ImageRepeat
                                .repeat, // Set repeat mode for the pattern
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
                              offset: Offset(
                                  0, 3), // changes the position of the shadow
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
                                child:
                                uploadPhoto(context, userData),
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
                                          collapsedBackgroundColor:
                                              Colors.black,
                                          collapsedTextColor: Colors.white,
                                          collapsedIconColor: Colors.white,
                                          backgroundColor: Colors.grey,
                                          textColor: Colors.black,
                                          iconColor: Colors.black,
                                          title: Text('BASIC INFO'),
                                          initiallyExpanded: true,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      gtBackgroundPaternImage),
                                                  // Replace with your pattern image path
                                                  fit: BoxFit.cover,
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.8),
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
                                                    gtController: userfullNameController,
                                                    gtHintText: 'Full Name',
                                                    gtPrefixIcon: Icon(
                                                      Icons
                                                          .person_outline_rounded,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  //SizedBox(height: 5.0),

                                                  //----------------
                                                  gtCustomRadioButtonWidget(
                                                    fieldName: 'Gender',
                                                    option1: 'Male',
                                                    option2: 'Female',
                                                    icon1: Icons.man,
                                                    icon2: Icons.woman,
                                                    initialValue:
                                                        userData.gender,
                                                    onChanged:
                                                        handleSelectedGender,
                                                  ),

                                                  //-------------------------
                                                  SizedBox(height: 10.0),
                                                  gtTextField(
                                                    gtController: emailController,
                                                    gtHintText: 'Email',
                                                    gtPrefixIcon: Icon(
                                                      Icons.email_outlined,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.0),
                                                  TextFormField(
                                                    initialValue:
                                                        userData.phoneNo,
                                                    decoration: InputDecoration(
                                                      prefixIcon: Icon(
                                                        Icons.phone,
                                                        color: Colors.grey,
                                                      ),
                                                      hintText:
                                                          '     Phone Number',
                                                      border:
                                                          OutlineInputBorder(),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .grey.shade300),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                      ),
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      enabled: false,
                                                    ),
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          9),
                                                      FilteringTextInputFormatter
                                                          .digitsOnly,
                                                    ],
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                                  //SizedBox(height: 5.0),

                                                  //-------------------------------
                                                  gtCustomRadioButtonWidget(
                                                    fieldName:
                                                        'Maritial Status',
                                                    option1: 'Single',
                                                    option2: 'Married',
                                                    icon1: Icons.person,
                                                    icon2: Icons.people,
                                                    initialValue:
                                                        userData.maritalStatus,
                                                    onChanged:
                                                        handleSelectedStatus,
                                                  ),
                                                  //-----------------------
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
                                          collapsedBackgroundColor:
                                              Colors.black,
                                          collapsedTextColor: Colors.white,
                                          collapsedIconColor: Colors.white,
                                          backgroundColor: Colors.grey,
                                          textColor: Colors.black,
                                          iconColor: Colors.black,
                                          title: Text('FOR CHURCH USE ONLY'),
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      gtBackgroundPaternImage),
                                                  // Replace with your pattern image path
                                                  fit: BoxFit.cover,
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.8),
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
                                                    gtController: christianNameController,
                                                    gtHintText: 'የክርስትና ስም',
                                                    gtPrefixIcon: Icon(
                                                      Icons.person_add_outlined,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.0),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'Select your Church\'s location',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                            BorderRadius
                                                                .circular(6.0),
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey.shade300),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: Icon(
                                                              Icons
                                                                  .church_outlined,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                          SizedBox(width: 15.0),
                                                          //---------------------------
                                                          Expanded(
                                                            flex: 9,
                                                            child:
                                                                DropdownButton<
                                                                    String>(
                                                              value: userData
                                                                  .churchLocation,
                                                              onChanged: (String?
                                                                  newValue) {
                                                                if (newValue !=
                                                                    null) {
                                                                  setState(() {
                                                                    // _churchLocationController =
                                                                    //     newValue; // Update the selected country
                                                                  });
                                                                }
                                                              },
                                                              items: churchCountyList.map<
                                                                  DropdownMenuItem<
                                                                      String>>((String
                                                                  value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: value,
                                                                  child: Text(
                                                                      value),
                                                                );
                                                              }).toList(),
                                                              underline: Container(
                                                                  height: 0,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),

                                                          //---------------------------------
                                                        ],
                                                      )),
                                                  SizedBox(height: 10.0),
                                                  gtTextField(
                                                    gtController: spiritualFathersNameController,
                                                    gtHintText: 'የንስሃ አባት ስም',
                                                    gtPrefixIcon: Icon(
                                                      Icons.person_add_outlined,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.0),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'የፅዋ ማህበር አባል ኖት?',
                                                        style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                  SizedBox(height: 5.0),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: RadioListTile<
                                                            String>(
                                                          title: Text('አዎ'),
                                                          value: 'አዎ',
                                                          groupValue:
                                                              selectedAnswer,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              selectedAnswer =
                                                                  value!; // Update the selected answer
                                                              isMember = true;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      // RadioListTile<String>(
                                                      //   title: Text('አይደለሁም መምዝገብ እፈልጋልው'),
                                                      //   value: 'አይደለሁም መምዝገብ እፈልጋልው',
                                                      //   groupValue: selectedAnswer,
                                                      //   onChanged: (value) {
                                                      //     setState(() {
                                                      //       selectedAnswer =
                                                      //           value!; // Update the selected answer
                                                      //     });
                                                      //   },
                                                      // ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: RadioListTile<
                                                            String>(
                                                          title: Text('አይደለሁም'),
                                                          value: 'አይደለሁም',
                                                          groupValue:
                                                              selectedAnswer,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              selectedAnswer =
                                                                  value!; // Update the selected answer
                                                              isMember = false;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10.0),
                                                  if (isMember == true) ...[
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                'ማህበርዎን ይምረጡ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                          SizedBox(height: 5.0),
                                                          Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          20.0,
                                                                      right:
                                                                          20.0,
                                                                      top: 5,
                                                                      bottom:
                                                                          5.0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6.0),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Icon(
                                                                      Icons
                                                                          .people_alt_outlined,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          15.0),
                                                                  //---------------------------
                                                                  Expanded(
                                                                    flex: 9,
                                                                    child: DropdownButton<
                                                                        String>(
                                                                      value:
                                                                          selectedUnion,
                                                                      onChanged:
                                                                          (String?
                                                                              newValue) {
                                                                        if (newValue !=
                                                                            null) {
                                                                          setState(
                                                                              () {
                                                                            selectedUnion =
                                                                                newValue; // Update the selected country
                                                                          });
                                                                        }
                                                                      },
                                                                      items: unionList.map<
                                                                          DropdownMenuItem<
                                                                              String>>((String
                                                                          value) {
                                                                        return DropdownMenuItem<
                                                                            String>(
                                                                          value:
                                                                              value,
                                                                          child:
                                                                              Text(value),
                                                                        );
                                                                      }).toList(),
                                                                      underline: Container(
                                                                          height:
                                                                              0,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),

                                                                  //---------------------------------
                                                                ],
                                                              )),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                  SizedBox(height: 10.0),
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
                                          collapsedBackgroundColor:
                                              Colors.black,
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
                                                  image: AssetImage(
                                                      gtBackgroundPaternImage),
                                                  // Replace with your pattern image path
                                                  fit: BoxFit.cover,
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.8),
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
                                                    gtController: educationalLevelController,
                                                    gtHintText: 'የትምህርት ደረጃ',
                                                    gtPrefixIcon: Icon(
                                                      Icons.work,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.0),
                                                  gtTextField(
                                                    gtController: occupationTypeController,
                                                    gtHintText: 'የስራ አይነት',
                                                    gtPrefixIcon: Icon(
                                                      Icons.fact_check,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.0),
                                                  gtTextField(
                                                    gtController: visaTypeController,
                                                    gtHintText: 'የቪዛ አይነት',
                                                    gtPrefixIcon: Icon(
                                                      Icons.question_mark,
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
                        // onTap: () {
                        //   UpdateUserProfile();
                        // },
                        onTap: () async {
                          String imageUrl ='';
                          if (_image != null || _image != "") {
                            // Upload the image to Firebase Storage
                            imageUrl = await uploadImageToFirebase(_image);
                          }
                            // Save the user data in Firestore along with the image URL
                            final urData = UserModel(
                              id: userData.id,
                              profilePicutreUrl: imageUrl,
                              fullName: userfullNameController.text.trim(),
                              gender: userData.gender,
                              phoneNo: userData.phoneNo,
                              maritalStatus: userData.maritalStatus,
                              churchLocation: userData.churchLocation,

                                email:emailController.text.trim(),
                                christianName: christianNameController.text.trim(),
                                spiritualFathersName: spiritualFathersNameController.text.trim(),
                                educationalLevel:educationalLevelController.text.trim(),
                                occupationType:occupationTypeController.text.trim(),
                                visaType:visaTypeController.text.trim(),

                            );
                            await profController.updateRecord(urData);

                        },
                        gtText: 'UPDATE',
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              );
            } else {
              return Center(child: Text(snapshot.error.toString()));
            }
          } else if (snapshot.hasError) {
            //Data is still being fetched
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Loading....'));
          }
        },
      )),
    );
  }

  GestureDetector uploadPhoto(BuildContext context, UserModel userData) {
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
                    getImage(ImageSource.gallery); // Open gallery to choose a photo
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
              : (userData.profilePicutreUrl != null && userData.profilePicutreUrl!.isNotEmpty)
              ? DecorationImage(
            image: NetworkImage(userData.profilePicutreUrl.toString()), // Display the profile image from the database
            fit: BoxFit.cover,
          )
              : null,
        ),
        child: _image.path.isEmpty && (userData.profilePicutreUrl == null || userData.profilePicutreUrl!.isEmpty)
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
