import 'package:flutter/material.dart';

import '../../../constants/image_strings.dart';
import 'services_card_widget.dart';
import 'services_card_withbutton_widget.dart';
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child:

        Column(

          children: [
            Image.asset(
              'assets/images/login_screen_image-old-small.png',
            ),
            Container(
              //height: MediaQuery.of(context).size.height,
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
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(
                  children: [

                    SizedBox(height: 7.0),
                    Row(
                      children: [
                        ServicesCard(
                          containerHeight: 250.0,
                          imagePath: 'assets/images/services/kidase.jpg',
                          name: 'ቅዳሴ',
                          description:
                          'ዘወትር ቅዳሜ እና እሁድ \nከ 10፡30AM እስከ 8:00AM',
                        ),
                        SizedBox(width: 15.0),
                        ServicesCard(
                          containerHeight: 250.0,
                          imagePath: 'assets/images/services/timihirt.jpg',
                          name: 'የሰርክ መርሐ ግብር ',
                          description:
                          'ዘወትር ረቡዕ \n ከ7:30 - 9:30PM ',
                        ),

                      ],
                    ),

                    Center(child: Image.asset("assets/images/priests/divider.png")),

                    Row(
                      children: [
                        ServicesCardWithButton(
                          containerHeight: 250.0,
                          imagePath: 'assets/images/services/christining.jpg',
                          name: 'ክርስትና',
                          description:'',

                        ),
                        SizedBox(width: 15.0),
                        ServicesCardWithButton(
                          containerHeight: 250.0,
                          imagePath: 'assets/images/services/wedding.jpg',
                          name: 'ሰርግ',
                          description: ' ',
                        ),

                      ],
                    ),



                    // The following was a wider design
                    // SizedBox(height: 40.0),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //     child: Text('   ሳምንታዊ መርሃግብር ',
                    //     style : TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 14,
                    //     )
                    //     )),
                    // SizedBox(height: 10.0),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 40.0, right: 40),
                    //   child: Container(
                    //     height: 120.0,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(10.0),
                    //       ),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.8),
                    //           spreadRadius: 5,
                    //           blurRadius: 5,
                    //           offset: Offset(0, 3), // changes the position of the shadow
                    //         ),
                    //       ],
                    //       image: DecorationImage(
                    //         image: AssetImage('assets/images/services/kidase.jpg'),
                    //         fit: BoxFit.fill,
                    //       ),
                    //     ),
                    //     child: Align(
                    //       alignment: Alignment.topLeft, // Align the child to the bottom center
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(
                    //             top: 4.0,
                    //             left: 4.0),
                    //         child: Container(
                    //           padding: EdgeInsets.all(12.0),
                    //           decoration: BoxDecoration(
                    //             color: Colors.grey.withOpacity(0.8),
                    //             borderRadius: BorderRadius.circular(8.0),
                    //           ),
                    //           child: Text(
                    //             'ቅዳሴ',
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 14,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 20.0),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 40.0, right: 40),
                    //   child: Container(
                    //     height: 120.0,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(10.0),
                    //       ),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.8),
                    //           spreadRadius: 5,
                    //           blurRadius: 5,
                    //           offset: Offset(0, 3), // changes the position of the shadow
                    //         ),
                    //       ],
                    //       image: DecorationImage(
                    //         image: AssetImage('assets/images/services/timihirt.jpg'),
                    //         fit: BoxFit.fill,
                    //       ),
                    //     ),
                    //     child: Align(
                    //       alignment: Alignment.topLeft, // Align the child to the bottom center
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(
                    //             top: 4.0,
                    //             left: 4.0),
                    //         child: Container(
                    //           padding: EdgeInsets.all(12.0),
                    //           decoration: BoxDecoration(
                    //             color: Colors.grey.withOpacity(0.8),
                    //             borderRadius: BorderRadius.circular(8.0),
                    //           ),
                    //           child: Text(
                    //             'ስብከተ ወንጌል',
                    //             style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 14,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 20.0),
                    // Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text('   ተጨማሪ አገልግሎቶች ',
                    //         style : TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 14,
                    //         )
                    //     )),
                    // SizedBox(height: 10.0),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 40.0, right: 40),
                    //   child: Container(
                    //     height: 120.0,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(10.0),
                    //       ),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.8),
                    //           spreadRadius: 5,
                    //           blurRadius: 5,
                    //           offset: Offset(0, 3), // changes the position of the shadow
                    //         ),
                    //       ],
                    //       image: DecorationImage(
                    //         image: AssetImage('assets/images/services/christining.jpg'),
                    //         fit: BoxFit.fill,
                    //       ),
                    //     ),
                    //     child: Column(
                    //       children: [
                    //         Align(
                    //           alignment: Alignment.topLeft, // Align the child to the bottom center
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(
                    //                 top: 4.0,
                    //                 left: 4.0),
                    //             child: Container(
                    //               padding: EdgeInsets.all(12.0),
                    //               decoration: BoxDecoration(
                    //                 color: Colors.grey.withOpacity(0.8),
                    //                 borderRadius: BorderRadius.circular(8.0),
                    //               ),
                    //               child: Text(
                    //                 'ክርስትና',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 14,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(height: 20.0),
                    //         Align(
                    //           alignment: Alignment.bottomRight, // Align the child to the bottom center
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(
                    //                 bottom: 8.0,
                    //             right: 8.0),
                    //             child: Container(
                    //               padding: EdgeInsets.all(12.0),
                    //               decoration: BoxDecoration(
                    //                 color: Colors.black,
                    //                 borderRadius: BorderRadius.circular(8.0),
                    //               ),
                    //               child: Text(
                    //                 'BOOK NOW',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 14,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 20.0),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 40.0, right: 40),
                    //   child: Container(
                    //     height: 120.0,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(10.0),
                    //       ),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.8),
                    //           spreadRadius: 5,
                    //           blurRadius: 5,
                    //           offset: Offset(0, 3), // changes the position of the shadow
                    //         ),
                    //       ],
                    //       image: DecorationImage(
                    //         image: AssetImage('assets/images/services/wedding.jpg'),
                    //         fit: BoxFit.fill,
                    //       ),
                    //     ),
                    //     child: Column(
                    //       children: [
                    //         Align(
                    //           alignment: Alignment.topLeft, // Align the child to the bottom center
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(
                    //                 top: 4.0,
                    //                 left: 4.0),
                    //             child: Container(
                    //               padding: EdgeInsets.all(12.0),
                    //               decoration: BoxDecoration(
                    //                 color: Colors.grey.withOpacity(0.8),
                    //                 borderRadius: BorderRadius.circular(8.0),
                    //               ),
                    //               child: Text(
                    //                 'ሰርግ',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 14,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(height: 20.0),
                    //         Align(
                    //           alignment: Alignment.bottomRight, // Align the child to the bottom center
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(
                    //                 bottom: 8.0,
                    //                 right: 8.0),
                    //             child: Container(
                    //               padding: EdgeInsets.all(12.0),
                    //               decoration: BoxDecoration(
                    //                 color: Colors.black,
                    //                 borderRadius: BorderRadius.circular(8.0),
                    //               ),
                    //               child: Text(
                    //                 'BOOK NOW',
                    //                 style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 14,
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    ));
  }
}
