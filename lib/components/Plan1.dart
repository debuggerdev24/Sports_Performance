import 'package:flutter/material.dart';

import '../main.dart';

class Plan1 extends StatelessWidget {
  final String name;
  final String image;
  final String selected;
  final Function() onTap;

  const Plan1({
    required this.name,
    required this.image,
    required this.selected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width / 3.5,
        decoration: BoxDecoration(
          border: selected == name ? Border.all(color: darkMode.value ? Colors.white24 : Colors.black) : null,
          color: selected == name ? Colors.blue.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: selected == name ? Colors.blue.shade900 : Colors.cyan.shade400,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: selected == name ? Colors.white : Colors.black,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Image.asset(
                image,
                width: double.infinity,
                height: size.height / 8,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
