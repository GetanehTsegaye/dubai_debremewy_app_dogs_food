import 'package:flutter/material.dart';
class UnionLeaderProfile extends StatelessWidget {
  const UnionLeaderProfile({
    super.key,

    required this.imagePath,
    required this.name,
    required this.description,
  });


  final String imagePath;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5.0),
          Container(
            padding: EdgeInsets.all(2.0),
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
              height: 100.0,
              width: 100.0,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
                child: Image.asset( imagePath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14),
          ),
          SizedBox(height: 7.0),
          Text(
            description,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}