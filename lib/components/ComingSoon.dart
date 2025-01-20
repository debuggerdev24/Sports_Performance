import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/MyButtton.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            Image.asset(
              'assets/images/coming_soon.png',
              height: 200,
            ),
            Spacer(),
            MyButton(
              borderRadius: 30,
              onTap: () {
                Get.offAllNamed('/main-screen', arguments: [context]);
              },
              sizeWidth: size.width * 0.7,
              title: 'Back to Home',
            ),
            SizedBox(
              height: size.height * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}
