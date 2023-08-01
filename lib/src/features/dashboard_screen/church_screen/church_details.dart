import 'package:carousel_slider/carousel_slider.dart';
import 'package:dubai_debremewy_app_dogs_food/src/features/dashboard_screen/church_screen/priests_profile_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/color_strings.dart';
import '../../../constants/image_strings.dart';
import '../home_screen/home_icon_buttons.dart';
import '';

class ChurchDetailsScreen extends StatefulWidget {
  const ChurchDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ChurchDetailsScreen> createState() => _ChurchDetailsScreenState();
}

class _ChurchDetailsScreenState extends State<ChurchDetailsScreen> {

  int _current = 0;
  CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/images/Churchs/SharjahChurch.png',
      'assets/images/Churchs/AbudhabiChurch.png',
      'assets/images/Churchs/JebelAliChurch.png'
      // 'assets/images/Churchs/AbudhabiChurch.png',
      // 'assets/images/Churchs/JebelAliChurch.png',
      // Add more image URLs here
    ];

    final List<OtherChurchs> churchs = [
      OtherChurchs(
        impagePath: gtDubaiChurch,
        googleMapUrl: "https://goo.gl/maps/mSLa5Un1HQH9mDqa8",
        Address: "Holy Trinity Church\nOud Metha, 19Street",
      ),
      OtherChurchs(
        impagePath: 'assets/images/Churchs/AbudhabiChurch.jpg',
        googleMapUrl: "https://goo.gl/maps/SeVqAMHhrxt31n7j7",
        Address: "አቡዳቢ ምስካየ ኅዙናን",
      ),
      OtherChurchs(
        impagePath: 'assets/images/Churchs/JebelAliChurch.jpg',
        googleMapUrl: "https://goo.gl/maps/4p9Rwcf4AAEuqk2Q7",
        Address: "The Christ Church in Jebel Ali",
      ),
      // Add more church widgets here with different parameters
    ];
    late final void Function(int index) onImageClicked;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 10.0,
          ),
          child: Container(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.0),
                CarouselSlider.builder(
                  carouselController: _controller,
                  itemCount: churchs.length,
                  options: CarouselOptions(
                    height: 260,
                    viewportFraction: 0.9,
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return Column(
                      children: [
                        SizedBox(height: 7.0),
                        churchs[index],
                      ],
                    );
                  },
                ),

                //The custom indicator row below will display circles that indicate the active carousel item.

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: churchs.asMap().entries.map((entry) {
                //     return GestureDetector(
                //       onTap: () => _controller.animateToPage(entry.key),
                //       child: Container(
                //         width: 12.0,
                //         height: 12.0,
                //         margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           color: (Theme.of(context).brightness == Brightness.dark
                //               ? Colors.white
                //               : Colors.black)
                //               .withOpacity(_current == entry.key ? 0.9 : 0.4),
                //         ),
                //       ),
                //     );
                //   }).toList(),
                // ),

                // OtherChurchs(
                //   impagePath: gtDubaiChurch,
                //   googleMapUrl: "https://goo.gl/maps/mSLa5Un1HQH9mDqa8",
                //   Address: "Holy Trinity Church\nOud Metha,19Street",
                // ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   "አባቶች",
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    // ),

                    Center(child: Image.asset("assets/images/priests/divider.png")),
                  ],
                ),
                SizedBox(height: 7.0),

                Row(
                  children: [
                    PriestsProfileCard(
                      containerHeight: 250.0,
                      imagePath: 'assets/images/priests/abune-matyas.jpg',
                      name: 'ብፁዕ ወቅዱስ አቡነ ማትያስ',
                      description:
                          'ቀዳማዊ ፓትርያርክ ርዕሰ ሊቃነ\nጳጳሳት ዘኢትዮጵያ ሊቀ ጳጳስ\nዘአክሱም ወእጨጌ ዘመንበረ\nተክለሃይማኖት',
                    ),
                    SizedBox(width: 15.0),
                    PriestsProfileCard(
                      containerHeight: 250.0,
                      imagePath: 'assets/images/priests/abune-demitors.jpg',
                      name: 'ብፅዕ አቡነ ድሜጥሮስ',
                      description:
                      'የሊባኖስ ፣ የተባበሩት ዓረብ\nኤማሬትስ እና የመካከለኛው\nምስራቅ ሊቀ ጳጳስ',
                    ),

                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    PriestsProfileCard(
                      containerHeight: 230.0,
                      imagePath: 'assets/images/priests/kesis Dereje.jpg',
                      name: 'መልአከ መዊዕ ቀሲስ ደረጀ ጅማ',
                      description:
                      '',
                    ),
                    SizedBox(width: 15.0),
                    PriestsProfileCard(
                      containerHeight: 230.0,
                      imagePath: 'assets/images/priests/mekonen.jpg',
                      name: 'ቄሰ ገበዝ መኮንን',
                      description:
                      '',
                    ),

                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    PriestsProfileCard(
                      containerHeight: 230.0,
                      imagePath: 'assets/images/photo_Placeholder.png',
                      name: 'ዘማሪ ቀሲስ መንክር ጌታነህ ',
                      description:
                      '',
                    ),
                    SizedBox(width: 15.0),
                    PriestsProfileCard(
                      containerHeight: 230.0,
                      imagePath: 'assets/images/photo_Placeholder.png',
                      name: 'ሊቀ ዲያቆናት ታደሰ ተስፋዬ',
                      description:
                      '',
                    ),

                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    PriestsProfileCard(
                      containerHeight: 230.0,
                      imagePath: 'assets/images/priests/melaku yemane.jpg',
                      name: 'መሪጌታ መልአኩ የማነ',
                      description:
                      '',
                    ),
                    SizedBox(width: 15.0),
                    PriestsProfileCard(
                      containerHeight: 230.0,
                      imagePath: 'assets/images/priests/diyaqon.jpg',
                      name: 'ዲያቆን ',
                      description:
                      '',
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}


class OtherChurchs extends StatelessWidget {
  const OtherChurchs({
    super.key,
    required this.impagePath,
    required this.googleMapUrl,
    required this.Address,

  });

  final  String impagePath;
  final String googleMapUrl;
  final String Address;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 10.0,
              right: 10.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(
                        0, 3), // changes the position of the shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                child: Image.asset(
                  impagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: HomeIconButtons(
                        iconImage: gtLocationPin,
                        gtIconText: 'Google Map',
                        gtIconTapped: () async {
                          // launchUrl ("https://goo.gl/maps/4Bv2WKy6oqjBmksV9" as Uri);

                          //String googleMapUrl = "https://goo.gl/maps/mSLa5Un1HQH9mDqa8";
                          Uri uri = Uri.parse(googleMapUrl);

                          // Check if the Google Maps app is installed
                          if (await canLaunchUrl(uri)) {
                            launchUrl(uri);
                          } else {
                            // The Google Maps app is not installed, so show an error
                            print(
                                "The Google Maps app is not installed");
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Container(
                          padding: EdgeInsets.only(
                            right: 40.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Align(
                                alignment:Alignment.centerRight ,
                                child: Text(
                                  Address,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal),
                                ),
                              ),

                            ],
                          ))),
                ],
              )),
SizedBox(height: 5.0,)
        ],
      ),
    );
  }
}
