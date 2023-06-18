
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



import '../../../constants/color_strings.dart';
import '../dashboard_screen.dart';
import 'book_of_the_day.dart';
import 'verse_of_the_day.dart';

class DailyWordSliderScreen extends StatefulWidget {
  DailyWordSliderScreen({Key? key}) : super(key: key);

  @override
  State<DailyWordSliderScreen> createState() => _DailyWordSliderScreenState();
}

class _DailyWordSliderScreenState extends State<DailyWordSliderScreen> {
  // this controller is used to keep track of which page we are on
  PageController _controller = PageController();

  // Keep track of if we are on the last page or not
  bool onLastPage = false;


  void homePage() {
    Get.to(()=>  DashboardScreen(),
        transition: Transition.rightToLeftWithFade,
        duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: gtBackgroundColor,
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  if (index == 1) {
                    onLastPage = true;
                  }
                });
              },
              children: [
                VerseOfTheDayScreen(),
                BookOfTheDayScreen(),
              ],
            ),
            //Bottom Text - Next and Done
            Container(
                alignment: Alignment(0, 0.90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('     '),
                    SmoothPageIndicator(controller: _controller, count: 2),
                    onLastPage
                        ? GestureDetector(
                            onTap: homePage,
                            child: Text('DONE'),
                          )
                        : GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                  duration: Duration(microseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Text('NEXT'),
                          )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
