import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportperformance/Components/Empty.dart';
import 'package:sportperformance/Components/MyLoading.dart';
import 'package:sportperformance/Components/MyNetworkError.dart';
import 'package:sportperformance/controllers/equipment_controller.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/utils/global.dart';

import 'MainScreen.dart';

class EquipmentScreen extends StatefulWidget {
  static const routeName = "EquipmentScreen";
  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
  final controller = Get.put(EquipmentController());

  late List<Map<String, dynamic>> tabs;

  @override
  Widget build(BuildContext context) {
    tabs = [
      {"title": context.translator.mainTab1, "icon": "assets/images/home.png"},
      // {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
      {"title": context.translator.mainTab3, "icon": "assets/images/settings.png"},
      {"title": context.translator.mainTab2, "icon": "assets/images/dumble.png"},
      {"title": context.translator.mainTab4, "icon": "assets/images/profile.png"},
    ];
    var size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(darkMode.value
                    ? "assets/images/darkBg.png"
                    : "assets/images/bgImage.PNG"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: size.width / 2.5,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
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
                        SizedBox(width: 9),
                        InkWell(
                          onTap: () {
                            Get.toNamed('/nutrition-screen');
                          },
                          child: Image.asset(
                            darkMode.value
                                ? "assets/images/plans_darkmode.png"
                                : "assets/images/plans.png", //"assets/images/trools.png",
                            height: 26,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: 6),
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
                    //         Get.toNamed('/goal-screen');
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
                  ],
                ),
                const SizedBox(height: 25),
                Obx(() {
                  return Expanded(
                    child: controller.isLoading.value
                        ? const MyLoading()
                        : controller.showError.value
                            ? const MyNetworkError()
                            : controller.equipment == ""
                                ? Empty()
                                : SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                    context.translator.planItem3,
                                          // context.translator.equipmentTitle,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        const SizedBox(height: 15),
                                        Text(
                                          "${controller.equipment} ",
                                          textAlign: TextAlign.justify,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(tabs: tabs)
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
//         onTap: (page) => Get.offAll(MainScreen(page)), //Navigator.of(context).pop(page),
//         items: List.generate(
//           tabs.length,
//           (index) => BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             icon: ImageIcon(AssetImage(tabs[index]['icon'])),
//             label: tabs[index]['title'],
//           ),
//         ),
//       ),