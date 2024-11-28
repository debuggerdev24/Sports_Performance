import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/MyButtton.dart';

class NoDataFound extends StatelessWidget {
  final String? img, title, buttnText;
  NoDataFound({this.buttnText, this.img, this.title});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img ?? 'https://picsum.photos/200',
              width: size.width * 0.3,
              height: size.width * 0.3,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              title ?? 'My Title',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: size.height * 0.03),
            MyButton(
              fontSize: 16,
              title: buttnText,
              sizeWidth: size.width * 0.9,
              borderRadius: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              sizeHieght: 55,
              onTap: () {
                // Navigator.pop(context);
                Get.offAllNamed('/user-home', arguments: [context]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
