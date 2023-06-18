import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../constants/image_strings.dart';
import 'home_screen/home_icon_buttons.dart';
import 'home_screen/icons_for_half_circle.dart';

class ClickableImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            gtHomePageBGImage, // Replace with your image path
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Row(
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
                    height: 120.0,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20.0),
                          Container(
                            margin: EdgeInsets.only(left: 30.0),
                            child: Column(
                              children: [
                                Text(
                                  'የዕለቱ የመፅሐፍ ቅዱስ ቃል',
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
          ),
          Positioned(
            top: 160,
            left: 53,
            child: GestureDetector(
              onTap: () {
                // Handle the click event for this portion of the image
              },
              child: IconsForHalfCircle(
                iconImage: gtBooks,
                gtIconText: 'Books',
                gtIconTapped: () {},
              ),
            ),
          ),
          Positioned(
            top: 231,
            left: 154,
            child: GestureDetector(
              onTap: () {
                // Handle the click event for this portion of the image
              },
              child: IconsForHalfCircle(
                iconImage: gtChurch,
                gtIconText: 'Church',
                gtIconTapped: () {},
              ),
            ),
          ),

          Positioned(
            top: 339,
            left: 202,
            child: GestureDetector(
              onTap: () {
                // Handle the click event for this portion of the image
              },
              child: IconsForHalfCircle(
                iconImage: gtCalendar,
                gtIconText: 'Calendar',
                gtIconTapped: () {},
              ),
            ),
          ),
          Positioned(
            top: 464,
            left: 202,
            child: GestureDetector(
              onTap: () {
                // Handle the click event for this portion of the image
              },
              child: IconsForHalfCircle(
                iconImage: gtChurch,
                gtIconText: 'Church',
                gtIconTapped: () {},
              ),
            ),
          ),
          Positioned(
            top: 575,
            left: 138,
            child: GestureDetector(
              onTap: () {
                // Handle the click event for this portion of the image
              },
              child: IconsForHalfCircle(
                iconImage: gtLive,
                gtIconText: 'Live',
                gtIconTapped: () {},
              ),
            ),
          ),
          Positioned(
            top: 640,
            left: 30,
            child: GestureDetector(
              onTap: () {
                // Handle the click event for this portion of the image
              },
              child: IconsForHalfCircle(
                iconImage: gtUnions,
                gtIconText: 'Unions',
                gtIconTapped: () {},
              ),
            ),
          ),

          // Add more Positioned widgets with GestureDetector for other clickable portions
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ClickableImage()));
}
