import 'package:flutter/material.dart';

import '../main.dart';

// class MyCard extends StatelessWidget {
//   final String name;
//   final String image;
//   final String selected;
//   final int index;
//   final Function() onTap;
//
//   const MyCard({
//     required this.name,
//     required this.image,
//     required this.selected,
//     required this.onTap,
//     required this.index,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 300),
//         height: size.height * 0.19,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 12,
//               color: Colors.black26,
//               offset: Offset(0, 5),
//             ),
//           ],
//           border: selected == name
//               ? Border.all(color: Colors.blueAccent, width: 2)
//               : null,
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Column(
//           children: [
//             // Name Box with Gradient
//             Container(
//               alignment: Alignment.center,
//               padding: const EdgeInsets.symmetric(vertical: 12),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.blue.shade700, Colors.cyan.shade600],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(18),
//                   topRight: Radius.circular(18),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Text(
//                   name,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                     fontFamily: "Montserrat",
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             // Image Box
//             Expanded(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(18),
//                   bottomRight: Radius.circular(18),
//                 ),
//                 child: Stack(
//                   children: [
//                     Image.asset(
//                       image,
//                       width: double.infinity,
//                       height: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                     if (selected == name)
//                       Container(
//                         color: Colors.black38, // Overlay when selected
//                         child: Center(
//                           child: Icon(
//                             Icons.check_circle_outline,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyCard extends StatelessWidget {
  final String name;
  final String image;
  final String selected;
  final int index;
  final Function() onTap;

  const MyCard({
    required this.name,
    required this.image,
    required this.selected,
    required this.onTap, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.height * 0.195,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: Colors.black26,
              offset: Offset(0, 5),
            ),
          ],
          border: selected == name
              ? Border.all(color: Colors.blueAccent, width: 2)
              : null,
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        // decoration: BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(blurRadius: 11, color: Colors.black38,offset: Offset(0, 0)),
        //   ],
        //   border: selected == name
        //       ? Border.all(color: darkMode.value ? Colors.white24 : Colors.black)
        //       : null,
        //   // color: selected == name ? Colors.blue.shade100 : Colors.grey.shade200,
        //   color: Colors.blue.shade100,
        //   borderRadius: BorderRadius.circular(18),
        // ),
        child: Column(
          children: [
            //todo -----> name box
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 9,horizontal: 9),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade800, Colors.cyan.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                // color: index % 2 == 0 ? Colors.blue.shade900 : Colors.cyan.shade700,
                //selected == name ? Colors.blue.shade900 : Colors.cyan.shade400,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: size.width * 0.035,
                  color: Colors.white,//selected == name ? Colors.white : Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            //todo ----> body image
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
