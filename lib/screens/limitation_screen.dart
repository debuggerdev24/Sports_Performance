import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportperformance/extensions/context_extension.dart';

import '../main.dart';
import '../utils/global.dart';

class LimitationScreen extends StatefulWidget {
  const LimitationScreen({super.key});

  @override
  State<LimitationScreen> createState() => _LimitationScreenState();
}

class _LimitationScreenState extends State<LimitationScreen> {
  late List<Map<String, dynamic>> tabs;

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

    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(context),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: size.width / 2.5,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            spacing: 8,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/entertainment-screen');
                                },
                                child: Image.asset(
                                  "assets/images/tool.png",
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/plan&programing');
                                },
                                child: Image.asset(
                                  darkMode.value
                                      ? "assets/images/plans_darkmode.png"
                                      : "assets/images/plans.png",
                                  //"assets/images/tool.png",
                                  height: 25,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/notification');
                                },
                                child: Image.asset(
                                  darkMode.value
                                      ? "assets/images/notifi_darkmode.png"
                                      : "assets/images/notifi.png",
                                  //"assets/images/notification.png",
                                  height: 28,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
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
                        ],
                      ),
                    ],
                  ),
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
