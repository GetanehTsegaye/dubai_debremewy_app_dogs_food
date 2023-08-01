import 'package:dubai_debremewy_app_dogs_food/src/features/dashboard_screen/union_screens/union_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../constants/image_strings.dart';


class UnionSearchScreen extends StatefulWidget {
  const UnionSearchScreen({Key? key}) : super(key: key);

  @override
  State<UnionSearchScreen> createState() => _UnionSearchScreenState();
}

class _UnionSearchScreenState extends State<UnionSearchScreen> {


  String searchText = '';
  List<String> unionData = [
    'መድሃኒዓለም ማህበር [ሚዲያ ክፍል]',
    'የኪዳነ ምህረት ማህበር',
    'የአጋዕዝተ አለም ስላሴ ማህበር [አርክቴክቶች] ',
    'መድሃኒዓለም ማህበር [ሀኪሞች]',
    'የቅዱስ ሚካኤል ማህበር ',
    'የቅዱስ ገብርኤል ማህበር [ፓይለቶች]',
    'የቅድስት ድንግል ማርያም ማህበር',
    'የተክለ ሐይማኖ ማህበር',
    'የቅድስት አርሴማ ማህበር',
    'የቅዱስ ገብርኤል ማህበር [ሹፌሮች]',

  ];

  List<String> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData.addAll(unionData);
  }

  void filterSearchResults(String query) {
    List<String> tempData = [];
    unionData.forEach((item) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        tempData.add(item);
      }
    });

    setState(() {
      searchText = query;
      filteredData.clear();
      filteredData.addAll(tempData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/donation/donation_church.png"),
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
                            margin: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Column(
                              children: [
                                Text(
                                  '"ማንም ከእነዚህ ከታናናሾቹ ለአንዱ ቀዝቃዛ ጽዋ ውኃ ብቻ በደቀ መዝሙር ስም የሚያጠጣ፥ እውነት እላችኋለሁ፥ ዋጋው አይጠፋበትም።"  ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 7.0),
                          Text(
                            'ማቴ 10፥40',
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('የጽዋ ማህበራት አላማ',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Text(
                          '1ኛ ፥  ምዕመናንን መንፈሳዊ ህይወት ማጠንከር \n '
                          '2ኛ ፥ ቅድስት ቤተክርስቲያንን ማገልገል\n'
                          '3ኛ ፥ ኢትዮጵያን ማገልገል\n',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal)),

                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: TextField(
                          onChanged: (value) {
                            filterSearchResults(value);
                          },
                          decoration: InputDecoration(
                            iconColor: Colors.black,

                            labelText: 'Search',
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'የማህበር ስም ያስገቡ',
                            prefixIcon: Icon(Icons.search, color: Colors.black,),
                            border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(  color:  Colors.black ,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.0,
                          right: 20.0,
                        ),
                        child: Container(
                          height: 400.0,
                          width: 400.0,
                          child: ListView.builder(

                            itemCount: filteredData.length,
                            itemBuilder: (context, index) {
                              // Set the background color for each list row
                              Color backgroundColor = index % 2 == 0 ? Colors.grey[200]! : Colors.white;

                              return Column(
                                children: [
                                  Container(
                                    color: backgroundColor,
                                    child: ListTile(
                                      title: Text(filteredData[index]),
                                      onTap: () {
                                        // Handle item tap
                                        Get.to(() => UnionDetailScreen(),);
                                      },
                                    ),
                                  ),
                                  Divider(
                                    height: 1, // Adjust the height as needed to control spacing
                                    color: Colors.transparent, // Use a transparent color for the divider
                                  ),
                                ],
                              );
                            },
                          )


                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    ));
  }
}
