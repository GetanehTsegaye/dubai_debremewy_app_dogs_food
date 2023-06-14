import 'package:dubai_debremewy_app_dogs_food/src/constants/image_strings.dart';
import 'package:flutter/material.dart';


import '../../constants/color_strings.dart';
import 'slider_widget.dart';

class BookOfTheDayScreen extends StatelessWidget {
  const BookOfTheDayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: gtBackgroundColor,
        body: SliderWidget(
          sliderImage: gtBookOfTheDayImage,
          sliderHeaderText: 'የዕለቱ ስንክሳር',
          sliderBodyText: ''
              'ሰኔ 2 \n \n'
              'አንድ አምላክ በሆነ በአብ በወልድ በመንፈስ ቅዱስ ስም \n'
              'ሰኔ ሁለት በዚች ቀን የመጥምቁ የቅዱስ_ዮሐንስ ሥጋ የቀናተኛው \n ኤልያስ ደቀ መዝሙር ከሆነው ከነቢዩ ኤልሳዕ ሥጋ ጋር በአንድነት \n ተገኘ፣ የኢትዮጵያ መነኰስ የቅዱስ ቀውስጦስ ዘመሐግሉ መታሰቢያቸው ነው።'
              '\n\n'
              '#ቅዱስ_ዮሐንስ_መጥምቀ_መለኮት (ፍልሠቱ) \n'
              'ሰኔ ሁለት በዚች ቀን የመጥምቁ የቅዱስ ዮሐንስ ሥጋ የቀናተኛው ኤልያስ ደቀ መዝሙር ከሆነው ከነቢዩ ኤልሳዕ ሥጋ ጋር በአንድነት ተገኘ።\n'
              '\n\n'
              '#አባ_ቀውስጦስ_ኢትዮዽያዊ'
              'በዚችም ዕለት የኢትዮጵያ መነኰስ የቀውስጦስ ዘመሐግሉ መታሰቢያቸው ነው። ',
          sliderVerseText: '',
        ),
      ),
    );
  }
}
