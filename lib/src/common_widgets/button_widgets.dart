import 'package:flutter/material.dart';
class gtButton extends StatelessWidget {
  const gtButton({Key? key, this.onTap, this.gtText}) : super(key: key);
  final Function()? onTap;
  final  gtText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25.0),
        //margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(color: Colors.black,
        borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Text(
            gtText,
            style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,),
          ),
        ),
      ),
    );
  }
}
