import 'package:flutter/material.dart';

import '../../../constants/image_strings.dart';



class SliderWidget extends StatelessWidget {
  SliderWidget({
    super.key,
    this.sliderImage,
    this.sliderHeaderText,
    this.sliderBodyText,
    this.sliderVerseText,
  });

  final sliderImage;
  final sliderHeaderText;
  final sliderBodyText;
  final sliderVerseText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 20.0,
            left: 40.0,
            right: 40.0,
          ),
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
                  offset: Offset(0, 3), // changes the position of the shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              child: Image.asset(
                sliderImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
                top: 3.0, left: 10.0, right: 10.0, bottom: 15.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(gtBackgroundPaternImage),
                  // Replace with your pattern image path
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.8), // Adjust opacity as needed
                    BlendMode.dstATop,
                  ),
                  repeat: ImageRepeat.repeat, // Set repeat mode for the pattern
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
                    offset: Offset(0, 3), // changes the position of the shadow
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
                  Text(
                    sliderHeaderText,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    margin: EdgeInsets.only(left: 30.0),
                    child: Text(sliderBodyText),
                  ),
                  SizedBox(height: 20.0),
                  Text(sliderVerseText)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}




//
// Widget build(BuildContext context) {
//   return SafeArea(child: Scaffold(body: SingleChildScrollView(
//     child: Column(
//       children: [
//         Container(
//           padding: EdgeInsets.only(
//             top: 20.0,
//             left: 40.0,
//             right: 40.0,
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10.0),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.8),
//                   spreadRadius: 5,
//                   blurRadius: 5,
//                   offset: Offset(0, 3), // changes the position of the shadow
//                 ),
//               ],
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(20.0),
//               ),
//               child: Image.asset(
//                 'assets/images/union/media_union_photo.jpeg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         Container(
//           padding: EdgeInsets.only(
//               top: 3.0, left: 10.0, right: 10.0, bottom: 15.0),
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(gtBackgroundPaternImage),
//                 // Replace with your pattern image path
//                 fit: BoxFit.cover,
//                 colorFilter: ColorFilter.mode(
//                   Colors.black.withOpacity(0.8), // Adjust opacity as needed
//                   BlendMode.dstATop,
//                 ),
//                 repeat: ImageRepeat.repeat, // Set repeat mode for the pattern
//               ),
//               color: Colors.white,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(20.0),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3), // changes the position of the shadow
//                 ),
//               ],
//               border: Border.all(
//                 color: Colors.grey.withOpacity(0.5),
//                 width: 1.0,
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 20.0),
//                 Text(
//                   'የማህበሩ አላማ',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(height: 20.0),
//                 Container(
//                   margin: EdgeInsets.only(left: 30.0),
//                   child: Text('የሚዲያ ክፍል አገልግሎት '),
//                 ),
//                 SizedBox(height: 20.0),
//
//               ],
//             ),
//           ),
//         ),
//       ],
//     )
//   ),));
// }