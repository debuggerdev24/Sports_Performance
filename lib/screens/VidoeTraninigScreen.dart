import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/ToolsInnerCategory.dart';
import 'package:sportperformance/Screens/VidoeTraninigDetailScreen.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Screens/NotificationScreen.dart';
import 'package:sportperformance/utils/global.dart';

import '../responsive_grid_package/src/responsive_grid_list.dart';
import 'MainScreen.dart';

class VidoeTraninigScreen extends StatefulWidget {
  static const routeName = 'VidoeTraninigScreen';

  @override
  State<VidoeTraninigScreen> createState() => _VidoeTraninigScreenState();
}

class _VidoeTraninigScreenState extends State<VidoeTraninigScreen> {
  // //final translator = TranslatorGenerator.instance;

  late String title;
  late String image;

  final List<Map<String, dynamic>> categories = [
    {"title": "Piernas", "icon": "assets/images/tool1.png"},
    {"title": "Pectorales", "icon": "assets/images/tool2.png"},
    {"title": "Espalda", "icon": "assets/images/tool3.png"},
    {"title": "Piernas", "icon": "assets/images/tool1.png"},
    {"title": "Pectorales", "icon": "assets/images/tool2.png"},
    {"title": "Espalda", "icon": "assets/images/tool3.png"},
    {"title": "Piernas", "icon": "assets/images/tool1.png"},
    {"title": "Pectorales", "icon": "assets/images/tool2.png"},
    {"title": "Espalda", "icon": "assets/images/tool3.png"},
  ];

  // final List<Map<String, dynamic>> tabs = [
  //   {"title": "Main.tab1", "icon": "assets/images/home.png"},
  //   {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
  //   {"title": "Main.tab3", "icon": "assets/images/settings.png"},
  //   {"title": "Main.tab4", "icon": "assets/images/profile.png"},
  // ];

  late List<Map<String, dynamic>> tabs;

  @override
  void didChangeDependencies() {
    Map arg = ModalRoute.of(context)!.settings.arguments as Map;
    title = arg['title'];
    image = arg['image'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    tabs = [
      {"title": context.translator.mainTab1, "icon": "assets/images/home.png"},
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
          backgroundImage(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      //todo  ------------> top right icons
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
                              SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/plan&programing');
                                },
                                child: Image.asset(
                                  darkMode.value
                                      ? "assets/images/plans_darkmode.png"
                                      : "assets/images/plans.png", //"assets/images/trools.png",
                                  height: 26,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(width: 5.5),
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
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //           builder: (context) => PlanScree(),
                          //       ),
                          //     );
                          //     //Get.toNamed('/goal-screen');
                          //   },
                          //   child: Text(
                          //     context.translator.planTitle2,
                          //     //translator.getString("Plan.title2"),
                          //     //'Goal',
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .bodyLarge!
                          //         .copyWith(
                          //           fontSize: 14,
                          //           color: primaryColor,
                          //           fontWeight: FontWeight.w600,
                          //         ),
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                  Gap(size.height * 0.015),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ResponsiveGridList(
                      shrinkWrap: true,
                      minItemWidth: size.width / 4,
                      children: List.generate(
                        categories.length,
                        (i) => ToolsInnerCategory(
                          image: categories[i]['icon'],
                          title: categories[i]['title'],
                          onTap: () async {
                            var page = await Navigator.of(context).pushNamed(
                              VidoeTraninigDetailScreen.routeName,
                              arguments: {
                                'title': title,
                                'subTitle': categories[i]['title'],
                                'image': image,
                              },
                            );
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop(page);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar:BottomNavigationBar(
        elevation: 0,
        iconSize: 30,
        currentIndex: 1,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).primaryColorLight,
        onTap: (page) => Get.to(MainScreen(page)),//todo  Navigator.of(context).pop(page),
        items: List.generate(
          tabs.length,
              (index) => BottomNavigationBarItem(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            icon: ImageIcon(AssetImage(tabs[index]['icon'])),
            label: tabs[index]['title'],
          ),
        ),
      ),
    );
  }
}

//BottomNavigationBar(
//         elevation: 0,
//         iconSize: 30,
//         currentIndex: 1,
//         selectedFontSize: 10,
//         unselectedFontSize: 10,
//         showUnselectedLabels: true,
//         unselectedItemColor: Colors.grey,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         selectedItemColor: Theme.of(context).primaryColorLight,
//         onTap: (page) => Get.to(MainScreen(page)),//todo Navigator.of(context).pop(page),
//         items: List.generate(
//           tabs.length,
//           (index) => BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             icon: ImageIcon(AssetImage(tabs[index]['icon'])),
//             label: tabs[index]['title'],
//           ),
//         ),
//       ),
