import 'package:flutter/material.dart';

class ToolsItem extends StatelessWidget {
  final String title;
  final String image;
  final Function()? onTap;

  const ToolsItem({
    required this.title,
    required this.image,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 55,
              width: size.width - 60,
              transform: Matrix4.translationValues(25, 0, 0),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(145, 220, 250, 1),
                    Color.fromRGBO(55, 139, 174, 0),
                  ],
                ),
              ),
              child: Container(
                alignment: Alignment.centerRight,
                width: size.width / 1.6,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
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
            Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.black,
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(image),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
