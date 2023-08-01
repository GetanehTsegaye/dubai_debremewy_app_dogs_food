import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../common_widgets/button_widgets.dart';
import 'puzzle_play_screen.dart';

class PuzzleHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/puzzle/stMarry.jpg'), // Assuming you have the solved puzzle image in the assets folder
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: gtButton(
                  onTap:(){
                    Get.to(() => PuzzlePlayScreen(),
                        transition: Transition.fadeIn,
                        duration: Duration(seconds: 1));
                  },
                  gtText: 'PLAY',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
