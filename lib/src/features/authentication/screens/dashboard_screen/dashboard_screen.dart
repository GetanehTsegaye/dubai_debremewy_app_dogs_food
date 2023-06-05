import 'package:flutter/material.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text('Build Your Profile to get started')
            ],
          ),
        ),
      ),
    ));
  }
}
