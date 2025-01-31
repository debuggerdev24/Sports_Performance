import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportperformance/Components/Empty.dart';
import 'package:sportperformance/Components/MyLoading.dart';
import 'package:sportperformance/Components/MyNetworkError.dart';
import 'package:sportperformance/Components/MyPlan.dart';
import 'package:sportperformance/controllers/plannig_controller.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/utils/global.dart';

import 'MainScreen.dart';

class PlanListScreen extends StatefulWidget {
  static const routeName = "PlanListScreen";
  @override
  State<PlanListScreen> createState() => _PlanListScreenState();
}

class _PlanListScreenState extends State<PlanListScreen> {
  final controller = Get.put(PlanningController());
  //final translator = TranslatorGenerator.instance;

  late List<Map<String, dynamic>> tabs;


  @override
  Widget build(BuildContext context) {
    tabs = [
      {"title": context.translator.mainTab1, "icon": "assets/images/home.png"},
      // {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
      {"title": context.translator.mainTab3, "icon": "assets/images/settings.png"},
      // {
      //   "title": context.translator.mainTab2,
      //   "icon": "assets/images/dumble.png"
      // },
      {"title": context.translator.mainTab4, "icon": "assets/images/profile.png"},
    ];
    var size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(context),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //todo -------------> appBar
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Image.asset(
                  //       "assets/images/logo.png",
                  //       width: size.width / 2.5,
                  //       height: 60,
                  //       fit: BoxFit.fill,
                  //     ),
                  //     Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         InkWell(
                  //           onTap: () {
                  //             Get.toNamed('/entertainment-screen');
                  //           },
                  //           child: Image.asset(
                  //             "assets/images/tool.png",
                  //             width: 30,
                  //             height: 30,
                  //             fit: BoxFit.fill,
                  //           ),
                  //         ),
                  //         SizedBox(width: 9),
                  //         InkWell(
                  //           onTap: () {
                  //             Get.toNamed('/nutrition-screen');
                  //           },
                  //           child: Image.asset(
                  //             darkMode.value
                  //                 ? "assets/images/plans_darkmode.png"
                  //                 : "assets/images/plans.png", //"assets/images/trools.png",
                  //             height: 26,
                  //             fit: BoxFit.fill,
                  //           ),
                  //         ),
                  //         SizedBox(width: 6),
                  //         InkWell(
                  //           onTap: () {
                  //             Get.toNamed('/notification');
                  //           },
                  //           child: Image.asset(
                  //             darkMode.value
                  //                 ? "assets/images/notifi_darkmode.png"
                  //                 : "assets/images/notifi.png",
                  //             //"assets/images/notification.png",
                  //             height: 28,
                  //             fit: BoxFit.fill,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     // Row(
                  //     //   mainAxisSize: MainAxisSize.min,
                  //     //   children: [
                  //     //     InkWell(
                  //     //       onTap: () {
                  //     //         Get.toNamed('/entertainment-screen');
                  //     //       },
                  //     //       child: Image.asset(
                  //     //         "assets/images/tool.png",
                  //     //         width: 30,
                  //     //         height: 30,
                  //     //         fit: BoxFit.fill,
                  //     //       ),
                  //     //     ),
                  //     //     const SizedBox(width: 10),
                  //     //     InkWell(
                  //     //       onTap: () {
                  //     //         Get.toNamed('/goal-screen');
                  //     //       },
                  //     //       child: Image.asset(
                  //     //         "assets/images/tool.png",
                  //     //         width: 30,
                  //     //         height: 30,
                  //     //         fit: BoxFit.fill,
                  //     //       ),
                  //     //     ),
                  //     //     const SizedBox(width: 10),
                  //     //     InkWell(
                  //     //       onTap: () {
                  //     //         Get.toNamed('/notification');
                  //     //       },
                  //     //       child: Image.asset(
                  //     //         "assets/images/notification.png",
                  //     //         width: 25,
                  //     //         height: 25,
                  //     //         fit: BoxFit.fill,
                  //     //       ),
                  //     //     ),
                  //     //   ],
                  //     // ),
                  //   ],
                  // ),
                  MyAppBar(),
                  Gap(10),
                  Obx(() {
                    return Expanded(
                      child: controller.isLoading.value
                          ? const MyLoading()
                          : controller.showError.value
                              ? const MyNetworkError()
                              : controller.plan.coachId == null
                                  ? Empty()
                                  : SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            context.translator.planListTitle,
                                            // translator.getString("PlanList.title"),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Gap(size.height * 0.018),
                                          MyPlan(controller.plan),
                                        ],
                                      ),
                                    ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(tabs: tabs)
    );
  }
}

// BottomNavigationBar(
//         elevation: 0,
//         iconSize: 30,
//         selectedFontSize: 10,
//         unselectedFontSize: 10,
//         showUnselectedLabels: true,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         selectedItemColor: Theme.of(context).primaryColorLight,
//         unselectedItemColor: Colors.grey,
//         onTap: (page) => Get.offAll(MainScreen(page)),//todo Navigator.of(context).pop(page),
//         items: List.generate(
//           tabs.length,
//           (index) => BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             icon: ImageIcon(AssetImage(tabs[index]['icon'])),
//             label: tabs[index]['title'],
//           ),
//         ),
//       ),
