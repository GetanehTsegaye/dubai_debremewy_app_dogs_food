import 'package:flutter/material.dart';
class gtTextField extends StatelessWidget {
  const gtTextField({
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
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          fillColor: Colors.white,
          filled: true),
    );
  }
}