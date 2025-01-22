import 'package:flutter/material.dart';
import 'package:sportperformance/Utils/utils.dart';
import 'package:sportperformance/Components/UnlcokPermium.dart';

class Plan2 extends StatelessWidget {
  final String title;
  final String selected;
  final bool isVip;
  final VoidCallback onTap;

  const Plan2({
    required this.title,
    required this.selected,
    required this.isVip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isVip) {
          Utils.showMyDialog(
            context,
            UnlockPermium(),
            padding: EdgeInsets.zero,
          );
        } else {
          onTap();
        }
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Colors.blue,
            width: 1.5,
          ),
        ),
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Text(
              title,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
