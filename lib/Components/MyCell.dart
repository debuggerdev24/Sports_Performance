import 'package:flutter/material.dart';

class MyCell extends StatelessWidget {
  final String title;
  final double? width;
  final double? textSize;
  final Color? textColor;

  const MyCell(this.title, {this.width, this.textColor, this.textSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 10,
              ),
        ),
      ),
    );
  }
}
