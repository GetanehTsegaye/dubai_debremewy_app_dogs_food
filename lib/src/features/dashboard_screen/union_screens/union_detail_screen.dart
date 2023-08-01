import 'package:flutter/material.dart';

import '../../../constants/color_strings.dart';
import '../../../constants/image_strings.dart';
import 'union_leader_profile_widget.dart';

class UnionDetailScreen extends StatelessWidget {
  const UnionDetailScreen({
    super.key,


  });

  @override



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gtBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.only(
              top: 20.0,
              left: 40.0,
              right: 40.0,
            ),
            child: Column(
              children: [
                Container(
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
                      "assets/images/union/media_union_photo.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  textAlign: TextAlign.center,
                  "ማኅበረ መድኃኔ ዓለም ዘደብረ መዊዕ \nመገናኛ ብዙኃን( ሚድያ)",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,) ,
                ),


              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  top: 3.0, left: 10.0, right: 10.0, bottom: 15.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        UnionLeaderProfile(
                          imagePath: 'assets/images/union/mikias.jpg',
                          name: 'ሚኪያስ ገረሱ',
                          description: 'ሙሴ',
                        ),
                        SizedBox(width: 15.0),
                        UnionLeaderProfile(
                          imagePath: 'assets/images/union/Getch.jpg',
                          name: 'ጌታነህ ፀጋዬ',
                          description: 'አሮን',
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        textAlign: TextAlign.left,
                        "የማህበሩ ሦስትዮሽ አላማ ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child:
                      Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 5.0),
                          Text("1ኛ መንፈሣዊ ህይወትን ማጠንከር "),
                          SizedBox(height: 5.0),
                          Text("2ኛ ቤተክርስትያንን በሚዲያ ፣ በህትመት ሥራዎች ፣ በቴክኖሎጂ ዘርፍ እና በመሳሰሉት ማገልገል"),
                          SizedBox(height: 5.0),
                          Text("3ኛ ሀገራችን ኢትዮጵያን ማገልገል"),
                        ],
                      ),

                    ),
                    SizedBox(height: 30.0),
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
                                  'Send Request',
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
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
