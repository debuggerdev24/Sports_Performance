import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/MyCardView.dart';
import 'package:sportperformance/extensions/context_extension.dart';

import '../main.dart';
import '../responsive_grid_package/src/responsive_grid_list.dart';
import '../utils/global.dart';

int _selectedItem = 0;

List dosAndDonts = [
  [
    "• Warm up properly with light cardio and dynamic stretches to prepare your body for exercise.",
    "• Focus on proper form to avoid injury and maximize the effectiveness of each movement.",
    "• Progress gradually by increasing weights and intensity over time to challenge your muscles safely.",
    "• Hydrate well by drinking enough water before, during, and after your workout to maintain performance.",
    "• Include rest periods of 60-90 seconds between sets to allow muscles to recover and perform better.",
    "• Mix cardio and strength training for balanced fitness, improving both endurance and muscle strength.",
    "• Follow a balanced workout plan that targets all major muscle groups throughout the week.",
    "• Stretch after your workout to improve flexibility, reduce soreness, and prevent injuries.",
    "• Be consistent with your workout schedule, aiming for at least 3-4 sessions per week.",
    "• Listen to your body and take rest days if you experience pain or extreme fatigue.",
    "• Use proper equipment like shoes, belts, or wraps to support your body during exercises.",
    "• Warm up and cool down properly to prepare your body for exercise and promote recovery.",
    "• Follow a balanced nutrition plan to fuel your workouts and optimize muscle recovery.",
    "• Track your progress by recording workouts, sets, reps, and weights to see improvements.",
    "• Stay positive and patient, as results take time—consistency is key to success."
  ],
  [
    "• Avoid skipping your warm-up, as it helps prepare your muscles and joints for the workout.",
    "• Never sacrifice form for heavier weights—incorrect technique can lead to injuries and ineffective results.",
    "• Progress too quickly can cause strain, so gradually increase weight and intensity to build strength safely.",
    "• Failing to stay hydrated can significantly impact your energy levels and overall performance.",
    "• Don’t neglect rest periods between sets, as they allow your muscles to recover and perform optimally.",
    "• Only focusing on one aspect of fitness (like cardio or strength) limits overall development and balance.",
    "• Skipping certain muscle groups can create imbalances and increase the risk of injury.",
    "• Stretching after your workout is essential to reduce stiffness and promote flexibility.",
    "• Missing workouts too often will slow down progress and may lead to loss of motivation.",
    "• Ignoring pain and pushing through discomfort can result in long-term injury.",
    "• Using improper equipment or not adjusting it to your body can lead to discomfort or injuries.",
    "• Neglecting your warm-up and cool-down increases the chances of muscle tightness and delayed recovery.",
    "• Skipping proper nutrition will hinder muscle growth and recovery, affecting overall results.",
    "• Failing to track your progress makes it hard to evaluate improvements and know when to challenge yourself.",
    "• Letting frustration take over when progress is slow can negatively impact your motivation and mindset.",
  ]
];

class LimitationScreen extends StatefulWidget {
  const LimitationScreen({super.key});

  @override
  State<LimitationScreen> createState() => _LimitationScreenState();
}

class _LimitationScreenState extends State<LimitationScreen> {
  late List<Map<String, dynamic>> tabs, items;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    tabs = [
      {
        "title": context.translator.mainTab1,
        "icon": "assets/images/home.png",
      },
      // {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
      {
        "title": context.translator.mainTab3,
        "icon": "assets/images/settings.png"
      },
      {
        "title": context.translator.mainTab2,
        "icon": "assets/images/dumble.png"
      },
      {
        "title": context.translator.mainTab4,
        "icon": "assets/images/profile.png"
      },
    ];
    items = [
      {
        "image": "assets/images/dos.jpg", //item1.png
        "title": "Dos"
      },
      {
        "image": "assets/images/don'ts.jpg", //item22.jpg
        "title": "Don'ts"
      }
    ];
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(context),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Image.asset(
                  //       "assets/images/logo.png",
                  //       width: size.width / 2.5,
                  //       height: 60,
                  //       fit: BoxFit.fill,
                  //     ),
                  //     Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Row(
                  //           spacing: 8,
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             InkWell(
                  //               onTap: () {
                  //                 Get.toNamed('/entertainment-screen');
                  //               },
                  //               child: Image.asset(
                  //                 "assets/images/tool.png",
                  //                 width: 30,
                  //                 height: 30,
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //             InkWell(
                  //               onTap: () {
                  //                 Get.toNamed('/plan&programing');
                  //               },
                  //               child: Image.asset(
                  //                 darkMode.value
                  //                     ? "assets/images/plans_darkmode.png"
                  //                     : "assets/images/plans.png",
                  //                 //"assets/images/tool.png",
                  //                 height: 25,
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //             InkWell(
                  //               onTap: () {
                  //                 Get.toNamed('/notification');
                  //               },
                  //               child: Image.asset(
                  //                 darkMode.value
                  //                     ? "assets/images/notifi_darkmode.png"
                  //                     : "assets/images/notifi.png",
                  //                 //"assets/images/notification.png",
                  //                 height: 28,
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  MyAppBar(),
                  Gap(size.height * 0.014),
                  //todo ----------> Metrics
                  Text(
                    context.translator.mainTab4,
                    // translator.getString("Metric.title"),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: size.width * 0.055,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Gap(size.height * 0.014),
                  ResponsiveGridList(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    minItemWidth: size.width * 0.3,
                    horizontalGridMargin: 8,
                    horizontalGridSpacing: 30,
                    verticalGridSpacing: 25,
                    verticalGridMargin: 0,
                    maxItemsPerRow: 2,
                    children: List.generate(
                      items.length,
                      (i) => MyCard(
                        name: items[i]["title"],
                        image: items[i]["image"],
                        selected: items[_selectedItem]['title'],
                        onTap: () {
                          setState(() {
                            _selectedItem = i;
                          });
                        },
                        index: i,
                      ),
                    ),
                  ),
                  Gap(18),
                  Expanded(
                    child: FadeInUp(
                      key: ValueKey<int>(_selectedItem),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                          (_selectedItem == 0) ? "Dos" : "Don'ts",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            ...List.generate(
                              dosAndDonts[_selectedItem].length,
                              (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    " ${dosAndDonts[_selectedItem][index]}",
                                    style: TextStyle(fontFamily: "DMSans"),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(tabs: tabs),
    );
  }
// late List<Map<String, dynamic>> tabs;
//
// List<double> values1 = [43.0, 58.0, 72.0, 86.0, 0.0, 0.0];
// List<double> values2 = [20.0, 23.0, 26.0, 29.0, 0.0, 0.0];
// List<double> values3 = [43.0, 58.0, 72.0, 86.0, 0.0, 0.0];
// List<double> values4 = [65.0, 72.0, 79.0, 86.0, 0.0, 0.0];
//
//
// @override
// Widget build(BuildContext context) {
//   var size = MediaQuery.of(context).size;
//   tabs = [
//     {
//       "title": context.translator.mainTab1,
//       "icon": "assets/images/home.png",
//     },
//     // {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
//     {
//       "title": context.translator.mainTab3,
//       "icon": "assets/images/settings.png"
//     },
//     {
//       "title": context.translator.mainTab2,
//       "icon": "assets/images/dumble.png"
//     },
//     {
//       "title": context.translator.mainTab4,
//       "icon": "assets/images/profile.png"
//     },
//   ];
//
//   return Scaffold(
//     body: Stack(
//       children: [
//         backgroundImage(context),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//           child: SafeArea(
//             child: Column(
//               children: [
//                 //todo ----------------------> Appbar
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Image.asset(
//                       "assets/images/logo.png",
//                       width: size.width / 2.5,
//                       height: 60,
//                       fit: BoxFit.fill,
//                     ),
//                     Row(
//                       spacing: 8,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Get.toNamed('/entertainment-screen');
//                           },
//                           child: Image.asset(
//                             "assets/images/tool.png",
//                             width: 30,
//                             height: 30,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Get.toNamed('/plan&programing');
//                           },
//                           child: Image.asset(
//                             darkMode.value
//                                 ? "assets/images/plans_darkmode.png"
//                                 : "assets/images/plans.png",
//                             //"assets/images/tool.png",
//                             height: 25,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             Get.toNamed('/notification');
//                           },
//                           child: Image.asset(
//                             darkMode.value
//                                 ? "assets/images/notifi_darkmode.png"
//                                 : "assets/images/notifi.png",
//                             //"assets/images/notification.png",
//                             height: 28,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         Gap(size.height * 0.012),
//                         Text(
//                           "Empuje Tren Inferior",
//                           style: TextStyle(fontSize: size.width * 0.042),
//                         ),
//                         Gap(8),
//                         SizedBox(
//                           height: 200,
//                           child: MyBarGraph(
//                             values: values1,
//                           ),
//                         ),
//                         Divider(color: Colors.black26),
//                         Gap(size.height * 0.02),
//                         Text(
//                           "Empuje Tren Superior",
//                           style: TextStyle(fontSize: size.width * 0.042),
//                         ),
//                         SizedBox(
//                           height: 200,
//                           child: MyBarGraph(
//                             values: values2,
//                           ),
//                         ),
//                         Divider(color: Colors.black26),
//                         Gap(size.height * 0.02),
//                         Text(
//                           "Tracción tren inferior",
//                           style: TextStyle(fontSize: size.width * 0.042),
//                         ),
//                         SizedBox(
//                           height: 200,
//                           child: MyBarGraph(
//                             values: values3,
//                           ),
//                         ),
//                         Divider(color: Colors.black26),
//                         Gap(size.height * 0.02),
//                         Text(
//                           "Tracción Tren Superior",
//                           style: TextStyle(fontSize: size.width * 0.042),
//                         ),
//                         SizedBox(
//                           height: 200,
//                           child: MyBarGraph(
//                             values: values4,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//     bottomNavigationBar: MyBottomNavBar(tabs: tabs),
//   );
// }
}

// todo --> old code
// Row(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     InkWell(
//       onTap: () {
//         Get.toNamed('/entertainment-screen');
//       },
//       child: Image.asset(
//         "assets/images/tool.png",
//         width: 30,
//         height: 30,
//         fit: BoxFit.fill,
//       ),
//     ),
//     const SizedBox(width: 10),
//     InkWell(
//       onTap: () {
//         // Navigator.push(context, MaterialPageRoute(builder: (context)=> PlanScree(changeTab),));
//       },
//       child: Image.asset(
//         "assets/images/tool.png",
//         width: 30,
//         height: 30,
//         fit: BoxFit.fill,
//       ),
//     ),
//     const SizedBox(width: 10),
//     InkWell(
//       onTap: () {
//         Get.toNamed('/notification');
//       },
//       child: Image.asset(
//         "assets/images/notification.png",
//         width: 25,
//         height: 25,
//         fit: BoxFit.fill,
//       ),
//     ),
//   ],
// ),
// InkWell(
//   onTap: () {
//     //Navigator.push(context, MaterialPageRoute(builder: (context)=> PlanScree(changeTab),));
//     //Get.toNamed('/goal-screen');
//   },
//   child: Text(
//     context.translator.planTitle2,
//     //'Pagos',
//     style:
//         Theme.of(context).textTheme.bodyLarge!.copyWith(
//               fontSize: 14,
//               color: primaryColor,
//               fontWeight: FontWeight.w600,
//             ),
//   ),
// )
