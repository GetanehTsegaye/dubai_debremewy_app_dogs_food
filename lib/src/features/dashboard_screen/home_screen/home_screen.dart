import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color_strings.dart';
import '../../../constants/image_strings.dart';
import 'home_icon_buttons.dart';
import '../news_screen.dart';
import '../youtube_slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: gtBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //Header Imagge
              Image.asset(
                gtHomeScreenImage,
              ),
              //Daily Bible word
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(0),
                    width: 80.0,
                    height: 80.0,
                    padding: EdgeInsets.only(
                      //top: 20.0,
                      left: 10.0,
                      //right: 40.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100.0),
                            topRight: Radius.circular(100.0),
                            topLeft: Radius.circular(100.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(
                                0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100.0),
                            topRight: Radius.circular(100.0),
                            topLeft: Radius.circular(100.0)),
                        child: Image.asset(
                          gtBibleImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 10.0, left: 5.0, right: 10.0, bottom: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0,
                                  3), // changes the position of the shadow
                            ),
                          ],
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20.0),
                            Container(
                              margin: EdgeInsets.only(left: 30.0),
                              child: Column(
                                children: [
                                  Text(
                                    'የዕለቱ የመፅሐፍ ቅዱስ ቃል',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                      'እርሱ ስለ እናንተ ያስባልና የሚያስጨንቃችሁን ሁሉ በእርሱ ላይ ጣሉት።')
                                ],
                              ),
                            ),
                            SizedBox(height: 7.0),
                            Text(
                              '1ኛ ጴጥሮስ 5፣7',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(height: 5.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 3.0, left: 10.0, right: 10.0, bottom: 15.0),
                child: Container(
                     height: MediaQuery.of(context).size.height*0.52,
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
                    child: Column(
                      children: [
                        SizedBox(height: 10.0),
                        // Youtube Videos
                        Container(height: 120.0, child: YoutubePage()),
                        SizedBox(height: 10.0),
                        // Service Icons
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  HomeIconButtons(
                                    iconImage: gtAnnouncement,
                                    gtIconText: 'News',
                                    gtIconTapped: () {
                                     Get.to(() => ClickableImage(),);
                                    },
                                  ),
                                  HomeIconButtons(
                                    iconImage: gtChurch,
                                    gtIconText: 'Church',
                                    gtIconTapped: () {},
                                  ),
                                  HomeIconButtons(
                                    iconImage: gtBooks,
                                    gtIconText: 'Books',
                                    gtIconTapped: () {},
                                  ),
                                  // HomeIconButtons(
                                  //   iconImage: gtConnect,
                                  //   gtIconText: 'Connect',
                                  //   gtIconTapped: () {},
                                  // ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // HomeIconButtons(
                                  //   iconImage: gtFathers,
                                  //   gtIconText: 'Fathers',
                                  //   gtIconTapped: () {},
                                  // ),
                                  HomeIconButtons(
                                    iconImage: gtPrayers,
                                    gtIconText: 'Prayers',
                                    gtIconTapped: () {},
                                  ),
                                  HomeIconButtons(
                                    iconImage: gtSermons,
                                    gtIconText: 'Sermons',
                                    gtIconTapped: () {},
                                  ),
                                  HomeIconButtons(
                                    iconImage: gtTestimonial,
                                    gtIconText: 'Testimonials',
                                    gtIconTapped: () {},
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //   children: [
                              //     HomeIconButtons(
                              //       iconImage: gtGames,
                              //       gtIconText: 'Games',
                              //       gtIconTapped: () {
                              //         Get.to(
                              //           () => YoutubePage(),
                              //         );
                              //       },
                              //     ),
                              //     HomeIconButtons(
                              //       iconImage: gtUnions,
                              //       gtIconText: 'Unions',
                              //       gtIconTapped: () {},
                              //     ),
                              //     HomeIconButtons(
                              //       iconImage: gtLive,
                              //       gtIconText: 'Live',
                              //       gtIconTapped: () {},
                              //     ),
                              //     HomeIconButtons(
                              //       iconImage: gtCalendar,
                              //       gtIconText: 'Calendar',
                              //       gtIconTapped: () {},
                              //     ),
                              //   ],
                              // )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
