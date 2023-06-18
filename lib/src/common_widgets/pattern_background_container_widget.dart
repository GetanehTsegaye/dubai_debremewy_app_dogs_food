import 'package:flutter/material.dart';

import '../constants/image_strings.dart';
class PatternBackgroundContainer extends StatelessWidget {
  const PatternBackgroundContainer({
    super.key, this.patternBackgroundContainerContent,

  });
  final patternBackgroundContainerContent;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          patternBackgroundContainerContent()
        ],
      ),
    );
  }
}