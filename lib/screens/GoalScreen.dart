import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportperformance/utils/global.dart';

import '../controllers/home/homeTab_controller.dart';
import '../main.dart';

// class GoalScreen extends StatelessWidget {
//   GoalScreen({super.key});
//
//   final homeController = Get.find<HomeScreenController>();
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         titleSpacing: 7,
//         leading: IconButton(
//           icon: Icon(
//             CupertinoIcons.back,
//           ),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         title: Text(
//           "Goals",
//         ),
//       ),
//       body: Stack(
//         children: [
//           backgroundImage(context),
//           SafeArea(
//             child: Obx(() {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: homeController.goals.isNotEmpty
//                     ? ListView.builder(
//                         itemCount: 1,
//                         itemBuilder: (context, index) =>
//                             Text(homeController.goals[0]),
//                       )
//                     : Text('No Goal Available'),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
