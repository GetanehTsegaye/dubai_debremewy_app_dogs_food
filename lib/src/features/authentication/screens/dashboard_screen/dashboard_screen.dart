import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common_widgets/button_widgets.dart';
import 'package:sliding_switch/sliding_switch.dart';

import '../../../../constants/color_strings.dart';
import '../../../../constants/image_strings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
            Center(
              child: Column(
                children: [
                  SizedBox(height: 5.0),
                  Container(
                    alignment: Alignment.topRight,
                      child: TextButton(onPressed: (){}, child:Text('Edit Profile'))),

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
                  SizedBox(height: 20.0),
                  Text('Getaneh Tsegaye'),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Center(
                        child: Text(
                          'LOG OUT',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.home_repair_service_sharp),
              title: Text('Services'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.calendar_month_outlined),
              title: Text('Calendar'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Programs/Events'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.people_alt_outlined),
              title: Text('ማህበራት'),
              onTap: () {},
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.language),
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [Text('Build Your Profile to get started')],
          ),
        ),
      ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: gtBackgroundColor,
            color: Colors.white,
            onTap: (index){
              if(index==2){
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
              };
            },
            items: [
            Icon(Icons.home),
            Icon(Icons.calendar_today),
            Icon(Icons.credit_card)

          ],),
    ));
  }
}
