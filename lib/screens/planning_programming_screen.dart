import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/MyCardView.dart';
import 'package:sportperformance/Utils/color.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/components/my_carousel_slider.dart';
import 'package:sportperformance/controllers/home/homeTab_controller.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/utils/global.dart';


import '../responsive_grid_package/src/responsive_grid_list.dart';

class PlanningAndProgramming extends StatefulWidget {
  // final Function(int page) changeTab;

  const PlanningAndProgramming();

  @override
  State<PlanningAndProgramming> createState() => _PlanningAndProgrammingState();
}

class _PlanningAndProgrammingState extends State<PlanningAndProgramming> {
  final homeController = Get.put(HomeScreenController());

  ////final translator = TranslatorGenerator.instance;

  String selectedPlan1 = "";
  int currentPage = 0;

  changeTab(int page) {
    currentPage = page;
    setState(() {});
  }

  List<Map<String, dynamic>> tabs = [];

  List<Map<String, dynamic>> items = [];

  String selectedPlan2 = "Plam 6 Meses";
  List plan2 = [
    "Plan 3 Meses",
    "Plam 6 Meses",
    "Plan Deportes",
    "Plan Alto Rendimiento",
  ];

  List<String> bannerImages = [
    "assets/images/banners/planning_programming/p_1.jpeg",
    "assets/images/banners/planning_programming/p_2.jpeg",
    "assets/images/banners/planning_programming/p_3.jpg",
    "assets/images/banners/planning_programming/p_4.jpg",
    "assets/images/banners/planning_programming/p_5.jpg",
    "assets/images/banners/planning_programming/p_6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
    items = [
      {
        'image': "assets/images/planning_programming/planing.jpeg",//'assets/images/plan.jpeg',
        'title': context.translator.planItem1
      }, //'Plan.item1'
      {
        'image': "assets/images/planning_programming/gear.jpeg",
        'title': context.translator.planItem3
      },
      // {'image': 'assets/images/metric.jpg', 'title': 'Plan.item2'},
      // {'image': 'assets/images/item33.jpg', 'title': 'Plan.item4'},
    ];
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    // ),);
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(context),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Column(
                children: [
                  //todo ----------------> App bar
                  MyAppBar(),
                  Expanded(
                    child: SingleChildScrollView(
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
                          //     Row(
                          //       spacing: 8,
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
                          //         InkWell(
                          //           onTap: () {
                          //             Get.toNamed('/nutrition-screen');
                          //           },
                          //           child: Image.asset(
                          //             darkMode.value
                          //                 ? "assets/images/plans_darkmode.png"
                          //                 : "assets/images/plans.png",
                          //             //"assets/images/trools.png",
                          //             height: 26,
                          //             fit: BoxFit.fill,
                          //           ),
                          //         ),
                          //         InkWell(
                          //           onTap: () {
                          //             Get.toNamed('/notification');
                          //           },
                          //           child: Image.asset(
                          //             darkMode.value
                          //                 ? "assets/images/notifi_darkmode.png"
                          //                 : "assets/images/notifi.png",
                          //             height: 28,
                          //             fit: BoxFit.fill,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          Gap(size.height * 0.014),
                          MyCarouselSlider(bannerImages: bannerImages),
                          Gap(size.height * 0.014),
                          Text(
                            context.translator.planTitle2,
                            // translator.getString("Plan.title2"),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Gap(size.height * 0.014),
                          ResponsiveGridList(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            minItemWidth: size.width * 0.3,
                            horizontalGridMargin: 8,
                            horizontalGridSpacing: size.width * 0.08,
                            verticalGridSpacing: 25,
                            verticalGridMargin: 0,
                            children: List.generate(
                              items.length,
                              (i) {
                                return MyCard(
                                  index: i,
                                  name: items[i]['title'],
                                  image: items[i]['image'],
                                  selected: items[selectedItem]['title'],
                                  onTap: () async {
                                    if (i == 0) {
                                      await Get.toNamed('/plan-list-screen');
                                    } else if (i == 1) {
                                      await Get.toNamed('/equipment-screen');
                                    }
                                    setState(() {
                                      selectedItem = i;
                                    });
                                    // if(i == 0){
                                    //   var page = await Get.toNamed('/metric-screen');
                                    //     widget.changeTab(page as int);
                                    //   log(page.toString());
                                    // }
                                    // else if(i == 1){
                                    //   var page = await Get.toNamed('/body-composition-screen');
                                    //   widget.changeTab(page as int);
                                    //   log(page.toString());
                                    // }
                                    // if (i == 0) {
                                    //   var page =
                                    //       await Get.toNamed('/plan-list-screen');
                                    //   widget.changeTab(page as int);
                                    // } else if (i == 1) {
                                    //   var page =
                                    //       await Get.toNamed('/metric-screen');
                                    //   widget.changeTab(page as int);
                                    // } else if (i == 2) {
                                    //   var page =
                                    //       await Get.toNamed('/equipment-screen');
                                    //   widget.changeTab(page as int);
                                    // }
                                  },
                                );
                              },
                            ),
                          ),
                        ],
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

int selectedItem = 0;
//BottomNavigationBar(
//         elevation: 0,
//         selectedFontSize: 10,
//         unselectedFontSize: 10,
//         showUnselectedLabels: true,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         iconSize: 30,
//         selectedItemColor: Theme.of(context).primaryColorLight,
//         unselectedItemColor: Colors.grey,
//         onTap: (page) => Get.offAll(MainScreen(page)),//Navigator.of(context).pop(page),
//         items: List.generate(
//           tabs.length,
//           (index) => BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             icon: ImageIcon(AssetImage(tabs[index]['icon'])),
//             label: tabs[index]['title'],
//           ),
//         ),
//       )
