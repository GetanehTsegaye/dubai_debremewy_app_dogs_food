import 'package:flutter/material.dart';
class gtTextField extends StatelessWidget {
  const gtTextField({
    super.key, this.gtHintText, this.gtPrefixIcon, this.gtController, this.gtInitialValue,
  });
  final gtPrefixIcon;
  final gtHintText;
  final gtController;
  final gtInitialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: gtController,
      initialValue: gtInitialValue,
      decoration: InputDecoration(
          prefixIcon:gtPrefixIcon ,
          hintText: gtHintText,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          fillColor: Colors.white,
          filled: true),

    );
  }
}