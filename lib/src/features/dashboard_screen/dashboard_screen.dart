import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/login_screen/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../common_widgets/textfield_widgets.dart';
import '../../constants/color_strings.dart';
import '../../constants/image_strings.dart';

import '../authentication/controllers/profile_controller.dart';
import '../authentication/models/user_model.dart';
import 'daily_words_slider_screens/daily_word_slider_screen.dart';
import 'home_screen/home_screen.dart';
import 'user_profile/profile_picture_upload_widget.dart';
import 'user_profile/user_profile_screen.dart';

//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 2;

  int _selectedPage = 2;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final List<Widget> _screens = [
    UserProfileScreen(),
    DailyWordSliderScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    //final themeState = Provider.of<DarkThemeProvider>(context);
    final profController = Get.put(ProfileController());
    bool _mode = false;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: gtBackgroundColor,
        drawer: Drawer(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10.0),
                  Image.asset(gtChurchLogo),
                  SizedBox(height: 10.0),
                  Text(
                    'የዱባይ ደብረመዊዕ ቅዱስ ሚካኤል ወቅድስት አርሴማ ኢ/ኦ/ተ/ቤ/ክርስትያን ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
              ListTile(
                leading:
                    Icon(Icons.home_repair_service_sharp, color: Colors.black),
                title: Text('Services'),
                onTap: () {},
              ),
              ListTile(
                leading:
                    Icon(Icons.calendar_month_outlined, color: Colors.black),
                title: Text('Calendar'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.event, color: Colors.black),
                title: Text('Programs/Events'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.people_alt_outlined, color: Colors.black),
                title: Text('ማህበራት'),
                onTap: () {},
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.language, color: Colors.black),
                title: Text('Select Language'),
                onTap: () {},
              ),
              SwitchListTile(
                secondary: Icon(Icons.palette_outlined),
                title: Text('Theme'),
                value: _mode,
                onChanged: (bool value) {
                  setState(() {
                    _mode = value!;
                  });
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined, color: Colors.black),
                title: Text('Sign Out'),
                onTap: () {
                  AuthenticationRepository.instance.logout();
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  Text(
                    'Follow Us On',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        gtFacebookLogo,
                        width: 50.0,
                        height: 50.0,
                      ),
                      SizedBox(width: 10.0),
                      Image.asset(
                        gtTikTokLogo,
                        width: 50.0,
                        height: 50.0,
                      ),
                      SizedBox(width: 10.0),
                      Image.asset(
                        gtYouTubeLogo,
                        width: 50.0,
                        height: 50.0,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: gtBackgroundColor,
          color: Colors.white,
          //index: _currentIndex,
          index: _selectedPage,
          key: _bottomNavigationKey,
          height: 50,
          items: <Widget>[
            Icon(Icons.person_outline_sharp, size: 30),
            Icon(Icons.calendar_today, size: 30),
            Icon(Icons.home, size: 30),
            //Icon(Icons.menu, size: 30),
            Icon(
              Icons.settings,
              size: 30,
            )
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              if (index == 0) {
                showModalBottomSheet<void>(
                  backgroundColor: Colors.black.withOpacity(0.1),
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 300,
                      child: Center(
                        child: SingleChildScrollView(
                          child: FutureBuilder(
                            future: profController.getUserData(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                //Data has been completly fetched
                                if (snapshot.hasData) {
                                  UserModel userData =
                                      snapshot.data as UserModel;

                                  //Controllers
                                  final profilePic;
                                  final christianNameController;
                                  final occupationTypeController;
                                  final mahiberNameController;



                                  if (userData.profilePicutreUrl.toString() == "") {
                                    profilePic =
                                    "gs://duba-debremewy-dogs-food-fbdb.appspot.com/photo_Placeholder.png";
                                  } else {
                                    profilePic =
                                        userData.profilePicutreUrl.toString();
                                  }


                                  if (userData.christianName.toString() == "") {
                                    christianNameController =
                                    "ክርስትና ስም";
                                  } else {
                                    christianNameController =
                                        userData.christianName.toString();
                                  }

                                    if (userData.occupationType.toString() ==
                                        "") {
                                      occupationTypeController =
                                      "የሥራ ዘርፍ";
                                    } else {
                                      occupationTypeController =
                                          userData.occupationType.toString();
                                    }

                                  if (userData.mahiberName.toString() ==
                                      "" || userData.mahiberName == null) {
                                    mahiberNameController =
                                    "የፅዋ ማህበር ስም";
                                  } else {
                                    mahiberNameController =
                                        userData.mahiberName.toString();
                                  }


                                  return Form(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(gtIdBackground),
                                              // Replace with your pattern image path
                                              fit: BoxFit.cover,
                                              // colorFilter: ColorFilter.mode(
                                              //   Colors.black.withOpacity(0.2),
                                              //   // Adjust opacity as needed
                                              //   BlendMode.dstATop,
                                              // ),
                                              repeat: ImageRepeat
                                                  .repeat, // Set repeat mode for the pattern
                                            ),
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0,
                                                    3), // changes the position of the shadow
                                              ),
                                            ],
                                            border: Border.all(
                                              color:
                                                  Colors.black.withOpacity(1),
                                              width: 1.0,
                                            ),
                                          ),
                                          padding: EdgeInsets.only(
                                              top: 3.0, bottom: 15.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 6,
                                                      child: Text(
                                                        'የዱባይ ደብረመዊዕ ቅዱስ ሚካኤል ወቅድስት አርሴማ ኢ/ኦ/ተ/ቤ/ክርስትያን ',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: CircleAvatar(
                                                        radius: 35,
                                                        backgroundImage:
                                                            AssetImage(
                                                                gtChurchLogo),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                            image: AssetImage('assets/images/photo_Placeholder.png'),)
                                                        ),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                              color: Colors.white,
                                                              width: 5.0,
                                                            ),
                                                          ),
                                                          height: 150,
                                                          //color: Colors.grey[300],
                                                          child: Image.network(
                                                            profilePic,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 5,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                gtBackgroundPaternImage),
                                                            // Replace with your pattern image path
                                                            fit: BoxFit.cover,
                                                            colorFilter:
                                                                ColorFilter
                                                                    .mode(
                                                              Colors.black
                                                                  .withOpacity(
                                                                      0.8),
                                                              // Adjust opacity as needed
                                                              BlendMode.dstATop,
                                                            ),
                                                          ),
                                                        ),
                                                        height: 150,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 16.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              christianNameController,

                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 8.0),
                                                            Text(
                                                              occupationTypeController,

                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 8.0),
                                                            SizedBox(
                                                                height: 8.0),
                                                            Text(
                                                              mahiberNameController,

                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],

                                      // children: <Widget>[
                                      //   Image.asset(gtSampleMembershipID),
                                      // ],
                                    ),
                                  );
                                } else {
                                  return Center(
                                      child: Text(snapshot.error.toString()));
                                }
                              } else if (snapshot.hasError) {
                                //Data is still being fetched
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return const Center(child: Text('Loading....'));
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (index == 3) {
                _openDrawer();
              } else {
                _selectedPage = index;
              }
            });
          },
        ),
      ),
    );
  }

  void _openDrawer() {
    _bottomNavigationKey.currentState?.setPage(_selectedPage);
    _scaffoldKey.currentState?.openDrawer();
  }
}
