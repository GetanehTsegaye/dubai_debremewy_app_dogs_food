import 'package:flutter/material.dart';

import '../../../constants/image_strings.dart';
import '../home_screen/home_icon_buttons.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/donation/donation_church.png"),
            SizedBox(height: 20.0),
// Center(
//   child:   Image.asset("assets/images/Churchs/live streaming.gif",
//   height: 200.0,),
// ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 0, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(height: 15.0),
                        HomeIconButtons(
                          iconImage: gtDonations,
                          gtIconText: '',
                          gtIconTapped: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset:
                                Offset(0, 3), // changes the position of the shadow
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(gtBackgroundPaternImage),
                          fit: BoxFit
                              .cover, // You can use BoxFit.fill, BoxFit.fitWidth, or others as per your requirement
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 15.0, bottom: 8.0),
                        child: Container(
                          height: 30.0,
                          child: Text('አስራት በኩራት', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 0, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(height: 15.0),
                        HomeIconButtons(
                          iconImage: gtDonations,
                          gtIconText: '',
                          gtIconTapped: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset:
                            Offset(0, 3), // changes the position of the shadow
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(gtBackgroundPaternImage),
                          fit: BoxFit
                              .cover, // You can use BoxFit.fill, BoxFit.fitWidth, or others as per your requirement
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 15.0, bottom: 8.0),
                        child: Container(
                          height: 30.0,
                          child: Text('ስለት', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 0, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(height: 15.0),
                        HomeIconButtons(
                          iconImage: gtDonations,
                          gtIconText: '',
                          gtIconTapped: () {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset:
                            Offset(0, 3), // changes the position of the shadow
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(gtBackgroundPaternImage),
                          fit: BoxFit
                              .cover, // You can use BoxFit.fill, BoxFit.fitWidth, or others as per your requirement
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 15.0, bottom: 8.0),
                        child: Container(
                          height: 30.0,
                          child: Text('ልዩ ስጦታ', style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                        ),

                      ),

                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40, right: 20, top: 0, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Image.asset("assets/images/donation/whats_app.png")
                      ),
                    ),
                  ),

                  SizedBox(width: 15.0,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 55.0,
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          'DONATE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
