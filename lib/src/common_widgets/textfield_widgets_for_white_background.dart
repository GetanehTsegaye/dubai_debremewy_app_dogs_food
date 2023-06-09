import 'package:flutter/material.dart';

import '../constants/color_strings.dart';
class gtTextFieldForWhiteBg extends StatelessWidget {
  const gtTextFieldForWhiteBg({
    super.key, this.gtHintText, this.gtPrefixIcon,
  });
  final gtPrefixIcon;
  final gtHintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(

          prefixIcon:gtPrefixIcon ,
          hintText: gtHintText,
         // hintStyle: TextStyle(color: Colors.black87),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: gtBackgroundColor,
          filled: true),
    );
  }
}