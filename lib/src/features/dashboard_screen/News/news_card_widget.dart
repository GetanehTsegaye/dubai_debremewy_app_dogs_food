import 'package:flutter/material.dart';


class NewsCardWidget extends StatelessWidget {
  final String username;
  final String userHandle;
  final String newsText;
  final String userProfileImage;

  NewsCardWidget({
    required this.username,
    required this.userHandle,
    required this.newsText,
    required this.userProfileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  //backgroundImage: NetworkImage(userProfileImage),
                    backgroundImage: AssetImage(userProfileImage),

                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '@$userHandle',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              newsText,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}


