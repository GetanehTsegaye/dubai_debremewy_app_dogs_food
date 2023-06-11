import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/authentication/screens/user_profile/reg_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common_widgets/button_widgets.dart';
import 'package:sliding_switch/sliding_switch.dart';

import '../../../../constants/color_strings.dart';
import '../../../../constants/image_strings.dart';
import '../login_screen/otp_screen.dart';
import '../user_profile/profile_picture_upload_widget.dart';
import 'book_of_the_day.dart';

import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    BookOfTheDayScreen(),
    HomeScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    //final themeState = Provider.of<DarkThemeProvider>(context);
    bool _mode = false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: gtBackgroundColor,
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
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
                    'የዱባይ ደብረመዊዕ ቅዱስ ሚካኤል ወቅድስት አርሴማ \n ኢ/ኦ/ተ/ቤ/ክርስትያን ', textAlign: TextAlign.center,
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
                onTap: () {},
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
          index: _currentIndex,
          height: 50,
          items: <Widget>[
            Icon(Icons.calendar_today, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.credit_card, size: 30),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              if (index == 2) {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Expanded(
                      child: SizedBox(
                        height: 300,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image.asset(gtSampleMembershipID),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            });
          },
        ),
      ),
    );
  }
}
