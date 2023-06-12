import 'package:dubai_debremewy_app_dogs_food/src/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../constants/color_strings.dart';
import 'slider_widget.dart';

class VerseOfTheDayScreen extends StatelessWidget {
  const VerseOfTheDayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:gtBackgroundColor,
      body: SliderWidget(
sliderImage: gtVerseOfTheDayImage,
        sliderHeaderText:'የዕለቱ የመፅሃፍ ቅዱስ ቃል' ,
        sliderBodyText: 'ፍቅርም እንደዚህ ነው፤ እግዚአብሔር እርሱ ራሱ እንደ ወደደን ስለ ኃጢአታችንም ማስተስሪያ ይሆን ዘንድ ልጁን እንደ ላከ '
            'እንጂ እኛ እግዚአብሔርን እንደ ወደድነው አይደለም።',
        sliderVerseText: '1ኛ ዮሐንስ 4፣10',
      ),
    );
  }
}


