import 'package:flutter/material.dart';

class IconsForHalfCircle extends StatelessWidget {
  IconsForHalfCircle({
    super.key,
    this.iconImage,
    this.gtIconTapped,
    this.gtIconText,
  });

  final iconImage;
  final gtIconTapped;
  final gtIconText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 5.0),
        GestureDetector(
          child: Container(
           padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(100.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes the position of the shadow
                ),
              ],
            ),
            child: Container(
              height: 50.0,
              width: 50.0,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
                child: Image.asset(
                  iconImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          onTap: gtIconTapped,
        ),
        SizedBox(width: 20.0),
        Text(gtIconText.toUpperCase(), style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20
        ),),
      ],
    );
  }
}
