import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Image.asset(
        "assets/images/empty.png",
        width: size.width / 2,
        height: size.width / 2,
        fit: BoxFit.fill,
      ),
    );
  }
}
