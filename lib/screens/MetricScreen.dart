import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportperformance/Utils/color.dart';
import 'package:sportperformance/controllers/metrics_controller.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/utils/global.dart';

MetricsController metricsController = Get.put(MetricsController());

class MetricScreen extends StatefulWidget {
  static const routeName = "MetricScreen";
  @override
  State<MetricScreen> createState() => _MetricScreenState();
}

class _MetricScreenState extends State<MetricScreen> {
  late List<Map<String, dynamic>> tabs = [];

  @override
  Widget build(BuildContext context) {
    tabs = [
      {"title": context.translator.mainTab1, "icon": "assets/images/home.png"},
      // {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
      {
        "title": context.translator.mainTab3,
        "icon": "assets/images/settings.png"
      },
      // {
      //   "title": context.translator.mainTab2,
      //   "icon": "assets/images/dumble.png"
      // },
      {
        "title": context.translator.mainTab4,
        "icon": "assets/images/profile.png"
      },
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
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //todo ----------> app bar
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Image.asset(
                  //       "assets/images/logo.png",
                  //       width: size.width / 2.5,
                  //       height: 60,
                  //       fit: BoxFit.fill,
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
                  //   ],
                  // ),
                  const MyAppBar(),

                  Gap(size.height * 0.015),
                  //todo ----------> Metrics
                  Expanded(
                    child: Obx(
                      () => (metricsController.metricsModel.value == null)
                          ? Center(child: myIndicator(context))
                          : SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.translator.metricTitle,
                                    // translator.getString("Metric.title"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Gap(size.height * 0.012),
                                  ...List.generate(
                                    metricsController
                                        .metricsModel.value!.data.length,
                                    (index) {
                                      final metric = metricsController
                                          .metricsModel.value!.data[index];
                                      return Container(
                                        width: size.width,
                                        margin:
                                            const EdgeInsets.only(bottom: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              color: primaryColor.withValues(
                                                  alpha: 0.2),
                                              // color: primaryColor.withValues(alpha: 0.2),
                                              spreadRadius: 2,
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: primaryColor, width: 0.5),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              decoration: BoxDecoration(
                                                color: primaryColor.withValues(
                                                    alpha: 0.2),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    metric.metricName,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(25),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Unit",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    metric
                                                        .unitType, //"Meter per second"
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 15),
                                                  const Text(
                                                    'Date',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  const Text(
                                                    '2023-11-23',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 15),
                                                  const Text(
                                                    "Latest Result",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    metric
                                                        .latestResult, //'Test result 70',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 15),
                                                  const Text(
                                                    "Target Result",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    metric
                                                        .targetResult, //'Target setted to 100',
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                    ),
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
}
//BottomNavigationBar(
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
