// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final List<String> imageList = [
//     'https://example.com/image1.jpg',
//     'https://example.com/image2.jpg',
//     'https://example.com/image3.jpg',
//     'https://example.com/image4.jpg',
//     'https://example.com/image5.jpg',
//     // Add more image URLs here
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Clickable Image Carousel'),
//         ),
//         body: Center(
//           child: CarouselSlider.builder(
//             itemCount: imageList.length,
//             options: CarouselOptions(
//               aspectRatio: 16 / 9,
//               viewportFraction: 0.6,
//               enlargeCenterPage: true,
//             ),
//             itemBuilder: (context, index, realIndex) {
//               return GestureDetector(
//                 onTap: () {
//                   // Handle the image click event here
//                   print('Image $index clicked!');
//                 },
//                 child: Image.network(
//                   imageList[index],
//                   fit: BoxFit.cover,
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// class OtherChurchs extends StatelessWidget {
//   final String imagePath;
//   final String googleMapUrl;
//   final String address;
//
//   const OtherChurchs({
//     required this.imagePath,
//     required this.googleMapUrl,
//     required this.address,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // Configure the container with the provided height and width
//       height: 200,
//       width: 300,
//       // Add your widget UI here with the provided imagePath, googleMapUrl, and address
//       child: Column(
//         children: [
//           Image.asset(imagePath),
//           Text(address),
//           ElevatedButton(
//             onPressed: () {
//               // Open the Google Maps URL when the button is pressed
//             },
//             child: Text('Open in Google Maps'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CarouselSliderDemo(),
//     );
//   }
// }
//
// class CarouselSliderDemo extends StatelessWidget {
//   final List<OtherChurchs> churchs = [
//     OtherChurchs(
//       imagePath: 'path_to_image_1',
//       googleMapUrl: "https://goo.gl/maps/mSLa5Un1HQH9mDqa8",
//       address: "Holy Trinity Church\nOud Metha, 19Street",
//     ),
//     OtherChurchs(
//       imagePath: 'path_to_image_2',
//       googleMapUrl: "https://goo.gl/maps/some_other_map_url",
//       address: "Some Other Church Address",
//     ),
//     // Add more church widgets here with different parameters
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Carousel Slider Demo')),
//       body: CarouselSlider(
//         options: CarouselOptions(height: 200),
//         items: churchs.map((church) {
//           return Builder(
//             builder: (BuildContext context) {
//               return church;
//             },
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Assuming you have a list of church items
final List<Widget> churchs = [
  // Your church widgets here
];


