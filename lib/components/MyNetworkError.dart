import 'package:flutter/material.dart';
import 'package:sportperformance/Utils/Color.dart';

class MyNetworkError extends StatelessWidget {
  final Color? bgColor;

  const MyNetworkError({this.bgColor});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width / 1.5,
        height: size.height / 4,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.network_check, color: primaryColor, size: 50),
            const SizedBox(height: 25),
            Text(
              "Please check your connection and try again Later",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
