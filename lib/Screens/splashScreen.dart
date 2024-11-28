import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final sp = Get.put(SplashController(context: context));
    // Timer(const Duration(seconds: 3), () => Get.offAndToNamed('/on-boarding'));
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            SizedBox(
              child: Image.asset(
                "assets/images/logo.png",
                // width: size.width / 1.3,
                // height: size.height / 4,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      )),
    );
  }
}
