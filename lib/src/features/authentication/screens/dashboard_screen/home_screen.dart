import 'package:flutter/material.dart';

import '../../../../constants/color_strings.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor: gtBackgroundColor,
      body: Text('Home Page '),
    ));
  }
}



