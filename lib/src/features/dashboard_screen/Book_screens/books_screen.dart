import 'package:flutter/material.dart';

import '../../../constants/image_strings.dart';
import '../home_screen/home_icon_buttons.dart';
import 'catagory_card_widget.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/books/books_header.png"),
            SizedBox(height: 20.0),
            Row(
              children: [
                CategoryCardWidget(
                  imagePath: 'assets/images/books/book.jpg',
                  name: 'መጸሐፍ ቅዱስ',
                ),
                CategoryCardWidget(
                  imagePath: 'assets/images/books/book.jpg',
                  name: 'የዘወትር ፀሎት',
                )
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                CategoryCardWidget(
                  imagePath: 'assets/images/books/book.jpg',
                  name: 'ዳዊት',
                ),
                CategoryCardWidget(
                  imagePath: 'assets/images/books/book.jpg',
                  name: 'ቅዳሴ መፅሃፍት',
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
