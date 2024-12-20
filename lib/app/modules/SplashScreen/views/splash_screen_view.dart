import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.count;
    return Scaffold(
      body: Container(
        decoration:   BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.deepPurple.withOpacity(0.8), // 80% opacity
                Colors.black38 // 60% opacity

              ],
              begin: Alignment.topCenter

          ),

        ),
        child: Center(
          child: Image(image: AssetImage("assets/images/splashScreen.png")),
        ),
      )
    );
  }
}
