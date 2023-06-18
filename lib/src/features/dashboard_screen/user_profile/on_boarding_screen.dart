import 'package:dubai_debremewy_app_dogs_food/src/constants/color_strings.dart';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common_widgets/textfield_widgets.dart';
import '../dashboard_screen.dart';





class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final lqController = LiquidController();
  int currentPage = 0;

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
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
    final lqController = LiquidController();
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            LiquidSwipe(
              pages: [
                SingleChildScrollView(
                  child: Container(
                    color: gtOnBoardingPage1Color,
                    height: size.height,
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
                              SizedBox(height: 30.0),
                              // Text(
                              //   '1/2',
                              //   style: TextStyle(
                              //       fontSize: 16.0,
                              //       fontWeight: FontWeight.bold),
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: gtOnBoardingPage2Color,
                  height: size.height,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: ()=> lqController.jumpToPage(page: 2),
                          child: const Text(
                            "Skip    ",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20.0),
                            Text(
                              'For the Church use only',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            gtTextField(
                              gtHintText: 'የክርስትና ስም',
                              gtPrefixIcon: Icon(
                                Icons.person_add_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            gtTextField(
                              gtHintText: 'የንስሃ አባት ',
                              gtPrefixIcon: Icon(
                                Icons.person_add_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            gtTextField(
                              gtHintText: 'Select your church',
                              gtPrefixIcon: Icon(
                                Icons.fact_check,
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

                            // Text(
                            //   '1/2',
                            //   style: TextStyle(
                            //       fontSize: 16.0, fontWeight: FontWeight.bold),
                            // ),
                            // gtButton(
                            //   onTap: () {
                            //     Get.to(() => DashboardScreen(),
                            //         transition: Transition.rightToLeftWithFade,
                            //         duration: Duration(seconds: 2));
                            //   },
                            //   gtText: 'NEXT',
                            // ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: gtOnBoardingPage3Color,
                  height: size.height,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            Get.to(() => DashboardScreen(),
                                transition: Transition.rightToLeftWithFade,
                                duration: Duration(seconds: 2));
                          },
                          child: const Text(
                            "Skip    ",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20.0),
                            Text(
                              'For the Church use only-2',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
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
                              gtHintText: 'City you live in?',
                              gtPrefixIcon: Icon(
                                Icons.fact_check,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            gtTextField(
                              gtHintText: 'Select the subcity',
                              gtPrefixIcon: Icon(
                                Icons.fact_check,
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
                            SizedBox(height: 10.0),
                            // Text(
                            //   '1/2',
                            //   style: TextStyle(
                            //       fontSize: 16.0, fontWeight: FontWeight.bold),
                            // ),
                            // gtButton(
                            //   onTap: () {
                            //     Get.to(() => DashboardScreen(),
                            //         transition: Transition.rightToLeftWithFade,
                            //         duration: Duration(seconds: 2));
                            //   },
                            //   gtText: 'NEXT',
                            // ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
              liquidController: lqController,
              slideIconWidget: const Icon(Icons.arrow_back_ios),
              enableSideReveal: true,
              onPageChangeCallback: onPageChangeCallback,
            ),
            Positioned(
              bottom: 60.0,
              child: OutlinedButton(
                onPressed: () {
                  int nextPage = lqController.currentPage + 1;
                  lqController.animateToPage(page: nextPage);
                },
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black26),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    foregroundColor: Colors.white),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Positioned(
                bottom: 10,
                child: AnimatedSmoothIndicator(
                  count: 3,
                  activeIndex: lqController.currentPage,
                  effect: const WormEffect(activeDotColor: Colors.black),
                ))
          ],
        ),
      ),
    );
  }

  onPageChangeCallback(int activePageIndex) {
    setState(() {
      widget.currentPage = activePageIndex;
    });
  }
}
