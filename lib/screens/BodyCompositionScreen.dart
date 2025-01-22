import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/DatePart.dart';
import 'package:sportperformance/Components/GraphPart.dart';
import 'package:sportperformance/Components/SelectTab.dart';
import 'package:sportperformance/Components/StudentsPart.dart';
import 'package:sportperformance/Utils/color.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';


import '../Components/OldDataStudentPart.dart';
import '../utils/global.dart';
import 'MainScreen.dart';

class BodyCompositionScreen extends StatefulWidget {
  static const routeName = "BodyCompositionScreen";
  @override
  State<BodyCompositionScreen> createState() => _BodyCompositionScreenState();
}

class _BodyCompositionScreenState extends State<BodyCompositionScreen> {
  ////final translator = TranslatorGenerator.instance;



  late List<Map<String, dynamic>> tabs;

  int selected = 0;
  List pages = [
    StudentsPart(),
    DatePart(),
    GraphPart(),
    OldDataStudentsPart(),
  ];

  @override
  Widget build(BuildContext context) {
    tabs = [
      {"title": context.translator.mainTab1, "icon": "assets/images/home.png"},
      // {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
      {"title": context.translator.mainTab3, "icon": "assets/images/settings.png"},
      {
        "title": context.translator.mainTab2,
        "icon": "assets/images/dumble.png"
      },
      {"title": context.translator.mainTab4, "icon": "assets/images/profile.png"},
    ];
    var size = MediaQuery.of(context).size;
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
                  //todo -----------------> appBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: size.width / 2.5,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
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
                      //     SizedBox(width: 9),
                      //     InkWell(
                      //       onTap: () {
                      //         Get.toNamed('/nu');//plan&programing
                      //       },
                      //       child: Image.asset(
                      //         darkMode.value
                      //             ? "assets/images/plans_darkmode.png"
                      //             : "assets/images/plans.png", //"assets/images/trools.png",
                      //         height: 26,
                      //         fit: BoxFit.fill,
                      //       ),
                      //     ),
                      //     SizedBox(width: 6),
                      //     InkWell(
                      //       onTap: () {
                      //         Get.toNamed('/notification');
                      //       },
                      //       child: Image.asset(
                      //         darkMode.value
                      //             ? "assets/images/notifi_darkmode.png"
                      //             : "assets/images/notifi.png",
                      //         //"assets/images/notification.png",
                      //         height: 28,
                      //         fit: BoxFit.fill,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Column(
                        children: [
                          Row(
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
                              const SizedBox(width: 9),
                              InkWell(
                                onTap: () {
                                  // Get.toNamed('/goal-screen');
                                },
                                child: Image.asset(
                                  darkMode.value
                                      ? "assets/images/plans_darkmode.png"
                                      : "assets/images/plans.png", //"assets/images/trools.png",
                                  height: 26,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(width: 6),
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
                          // InkWell(
                          //   onTap: () {
                          //     Get.toNamed('/goal-screen');
                          //   },
                          //   child: Text(
                          //     'Goal',
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
                  Gap(size.height * 0.015),
                  Text(
                    context.translator.bodyCompoTitle,
                    // translator.getString("BodyCompo.title"),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Gap(size.height * 0.015),
                  //todo ---------> main 3 section
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SelectTab(
                          title: context.translator.bodyCompoOption1,
                          index: "0",
                          selected: selected.toString(),
                          onTap: () {
                            selected = 0;
                            setState(() {});
                          },
                        ),
                        SelectTab(
                          title: context.translator.bodyCompoOption3,//todo ----> instead of 3
                          index: "1",
                          selected: selected.toString(),
                          onTap: () {
                            selected = 1;
                            setState(() {});
                          },
                        ),
                        SelectTab(
                          title: context.translator.bodyCompoOption2,
                          index: "2",
                          selected: selected.toString(),
                          onTap: () {
                            selected = 2;
                            setState(() {});
                          },
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 8),
                        //   child: SelectTab(
                        //     title: context.translator.bodyCompoOption4,
                        //     index: "3",
                        //     selected: selected.toString(),
                        //     onTap: () {
                        //       selected = 3;
                        //       setState(() {});
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Gap(15),
                  Expanded(child: pages[selected]),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(tabs: tabs),
    );
  }
}
