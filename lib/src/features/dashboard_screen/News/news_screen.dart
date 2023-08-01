import 'package:flutter/material.dart';

import '../../../constants/image_strings.dart';
import 'news_card_widget.dart';
class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/news/news_banner.png"),
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(
                  left:8.0,
              right: 8.0),
              child: Column(
                children: [

                  Container(
                    height: MediaQuery.of(context).size.height,
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

                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Example Usage

                          NewsCardWidget(
                            username: 'ሚኪያስ ገረሱ',
                            userHandle: 'ሚድያ_ክፍል',
                            newsText: 'በዱባይ ጀበል አሊ መካነ ስብሐት ቅድስት ሥላሴ ቤተክርስቲያን ዓመታዊ ክብረ  በዓል የሊባኖስ የተባበሩት አረብ ኤማሬትስ እና የመካከለኛው ምስራቅ ሀገረ ስብከት ሊቀ ጳጳስ ብፅዕ አቡነ ዲሜጥሮስ በተገኙበት ተከበረ። ሐምሌ 9 2015 ዓ.ም',
                            userProfileImage: 'assets/images/union/mikias.jpg',
                          ),
                          NewsCardWidget(
                            username: 'ዱባይ ደብረ መዊዕ',
                            userHandle: 'ሰበካ_ጉባኤ',
                            newsText: 'በዱባይ እና አካባቢው ለምትኖሩ ምዕመናን በሙሉ ዓርብ ለቅዳሜ አጥቢያ በአል አይን ደብረ ብ/አ/ገ ለሚከበረው ዓመታዊ የቅድስ ገብርኤል ክብረ በዓል የዱባይ ደብረ መዊዕ ሚ/ወቅ/አ/ቤ/ክ ባስ አዘጋጅቷል፡፡ በመሆኑም ከዚህ በታች በተጠቀሱትና በሚቀርባችሁ ቦታ በመመዝገብ የበዓሉ ተካፋዮች እንድትሆኑ ቅድስት ቤ/ክ ጥሪዋን ታስተላልፋለች',
                            userProfileImage: 'assets/logos/dubai_debremewy_church_logo.jpg',
                          ),
                          NewsCardWidget(
                            username: 'ቀሲስ ደረጀ ጅማ',
                            userHandle: 'ሰበካ_ጉባኤ',
                            newsText: '"እግዚአብሔር መልካም ነገር አደረገልን ደስም አለን"\nበሊባኖስ ፡ በተባበሩት ዓረብ ኤምሬትስ እና በመካከለኛው ምስራቅ ለምትኖሩ ኢትዮጵያኖች በሙሉ'
                            'በግንቦት 26 ቀን 2015 ዓ.ም በብፁዕ ወቅዱስ አቡነ ማትያስ ቀዳማዊ ፓትርያርክ ርእሰ ሊቃነ ጳጳሳት ዘኢትዮጵያ ሊቀ ጳጳስ ዘአክሱም ወእጨጌ ዘመንበረ ተክለ ሃይማኖት አማካኝነት ለብፁዕ አባታችን አቡነ ድሜጥሮስ  ከሀገረ ስብከቱ የተበረከተላቸውን  የመኪና ስጦታ  ዛሬ ሰኔ 17 ቀን 2015 ዓ.ም   ከመሸጫ መደብሩ (Al Futtiam ) በአካል በመገኘት ከድርጅቱ ኃላፊዎች  መኪናውን ተረክበዋል።',
                            userProfileImage: 'assets/images/priests/kesis Dereje.jpg',
                          ),
                          NewsCardWidget(
                            username: 'ሚኪያስ ገረሱ',
                            userHandle: 'ሚድያ_ክፍል',
                            newsText: 'የዓመቱ የመጨረሻ የአንድነት ጉባኤ እና የምስጋና መርሃግብር የፊታችን ሰኞ ሰኔ 17 2015 ዓ.ም ከጠዋቱ 8-11AM ይካሄዳል',
                            userProfileImage: 'assets/images/union/mikias.jpg',
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
