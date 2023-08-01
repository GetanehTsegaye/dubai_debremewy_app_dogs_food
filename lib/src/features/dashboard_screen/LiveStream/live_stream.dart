import 'package:flutter/material.dart';

import '../../../constants/image_strings.dart';

class LiveStreamScreen extends StatelessWidget {
  const LiveStreamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/Churchs/live streaming.gif"),
            SizedBox(height: 20.0),
// Center(
//   child:   Image.asset("assets/images/Churchs/live streaming.gif",
//   height: 200.0,),
// ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
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
                      left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                  child: Container(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                           // color: Colors.blue,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text('መጋቢት 24 ፣ 2015 ',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                                      ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('ከጠዋቱ 4:30 AM  ',
                                        style: TextStyle( fontSize: 16)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          //color: Colors.yellow,
                          child: Text(
                              ' ✞  ከዱባይ ደብረመዊ የሚተላለፈውን የዐቢይ ጾም ሰባተኛ ሳምንት ኒቆዲሞስ እና የጻድቁ አባታችን የአቡነ ተክለ ሃይማኖት ወርኃዊ በዓል ስርዓተ ቅዳሴን ለማየት የሚከተሉትን አማራጮች ላይ ይጫኑ ',
                              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),
                        ),
                        SizedBox(height: 15.0),
                        // Container(
                        //     //color: Colors.grey,
                        //     child: Text('✞  ከዱባይ ዱባይ ደብረ መዊዕ ቅዱስ ሚካኤል ወቅድስት አርሴማ ቤተክርስቲያን ')),

                        Row(
                          children: [
                            Expanded(
                              flex:1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      offset:
                                      Offset(0, 3), // changes the position of the shadow
                                    ),
                                  ],
                                ),
                                child: Image.asset('assets/logos/facebook_logo.png',
                                height: 60.0,),
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Expanded(
                              flex:1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      offset:
                                      Offset(0, 3), // changes the position of the shadow
                                    ),
                                  ],
                                ),
                                child: Image.asset('assets/logos/tiktok_logo.png',
                                  height: 60.0,),
                              ),
                            ),
                            SizedBox(width: 15.0),
                            Expanded(
                              flex:1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.8),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      offset:
                                      Offset(0, 3), // changes the position of the shadow
                                    ),
                                  ],
                                ),
                                child: Image.asset('assets/logos/youtube_logo.png',
                                  height: 60.0,),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
