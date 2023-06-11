import 'package:flutter/material.dart';

import '../../../../constants/color_strings.dart';

class BookOfTheDayScreen extends StatelessWidget {
  const BookOfTheDayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: gtBackgroundColor,
        body: Column(
          children: [
            RichText(
              text: TextSpan(
               style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                TextSpan(text: 'ሰኔ_2 \n', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.black)),
                TextSpan(text: 'አንድ አምላክ በሆነ በአብ በወልድ በመንፈስ ቅዱስ ስም'
                    'ሰኔ ሁለት በዚች ቀን የመጥምቁ የቅዱስ_ዮሐንስ ሥጋ የቀናተኛው ኤልያስ ደቀ መዝሙር ከሆነው #ከነቢዩ_ኤልሳዕ ሥጋ ጋር በአንድነት ተገኘ፣ '
                    'የኢትዮጵያ መነኰስ #የቅዱስ_ቀውስጦስ_ዘመሐግሉ መታሰቢያቸው ነው። '),
                TextSpan(text: '#ቅዱስ_ዮሐንስ_መጥምቀ_መለኮት (ፍልሠቱ) \n', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0,color: Colors.black)),
            TextSpan(text: 'ሰኔ ሁለት በዚች ቀን የመጥምቁ የቅዱስ ዮሐንስ ሥጋ የቀናተኛው ኤልያስ ደቀ መዝሙር ከሆነው ከነቢዩ ኤልሳዕ ሥጋ ጋር በአንድነት ተገኘ።'
                    ' ከሀዲው ንጉሥ ዑልያኖስ የጥጦስ ልጅ አስባስያኖስ ከአፈረሰው በኋላ በዘመኑ በኢየሩሳሌም የአይሁድ ምኵራባቸውን ሊሠራ በወደደ ጊዜ እርሱ'
                    ' በቅዱስ ወንጌል ደንጊያ በደንጊያ ላይ ተቀምጦ ሳይፈርስ በዚህ አይቀርም የተባለውን የእግዚአብሔርን ቃል ሊሽር ፈልጎ መሥራት በጀመረ ጊዜ ሦስት ጊዜ ፈረሰበት።'),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
