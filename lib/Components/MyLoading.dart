import 'package:flutter/material.dart';

class MyLoading extends StatelessWidget {
  final Color? bgColor;

  const MyLoading({this.bgColor});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width / 1.5,
        height: size.height / 4,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
