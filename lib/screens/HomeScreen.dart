import 'dart:developer';

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:sportperformance/Screens/planning_programming_screen.dart';
import 'package:sportperformance/Screens/shimmer/home_shimmer.dart';
import 'package:sportperformance/components/my_carousel_slider.dart';
import 'package:sportperformance/controllers/home/homeTab_controller.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Components/Item.dart';
import '../responsive_grid_package/src/responsive_grid_list.dart';
import '../utils/global.dart';
import 'indicator_screen.dart';


class HomeScreen extends StatefulWidget {
  // final Function(int page) changeTab;

  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Map<String, dynamic>> items;
  late final homeController;

  //final translator = TranslatorGenerator.instance;

  @override
  void initState() {
    homeController = Get.put(HomeScreenController());
    // _checkVersion();
    super.initState();
  }

  // todo ----------> new app update method
  Future<void> _checkVersion() async {
    try {
      final newVersion = NewVersionPlus(
        androidId: "com.snapchat.android",
        // iOSId: "com.technosquare.sportsperformance",
      );
      final status = await newVersion.getVersionStatus();
      if (status != null) {
        newVersion.showUpdateDialog(
          context: context,
          versionStatus: status,
          dialogTitle: "UPDATE!!!",
          dismissButtonText: "Skip",
          dialogText:
              "Please update the app from ${status.localVersion} to ${status.storeVersion}",
          dismissAction: () {
            SystemNavigator.pop();
          },
          updateButtonText: "Lets update",
        );
        log("DEVICE : ${status.localVersion}");
        log("STORE : ${status.storeVersion}");
      } else {
        log("No update information available.");
      }
    } catch (e) {
      log("Error checking version: $e");
    }
  }

  changeTab(int page) {
    currentPage = page;
    setState(() {});
  }

  int check = 0;
  int currentPage = 0;
  List<String> _bannerImages = [
    "assets/images/banners/home/h_1.jpg",
    "assets/images/banners/home/h_5.jpg",
    "assets/images/banners/home/h_2.jpg",
    "assets/images/banners/home/h_3.jpg",
    "assets/images/banners/home/h_4.jpg",
    "assets/images/banners/home/h_6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    items = [
      {
        "image": "assets/images/training.jpg", //item1.png
        "title": context.translator.homeItem1
      },
      {
        "image": "assets/images/nutritions.jpg", //item22.jpg
        "title": context.translator.homeItem2
      },
      {
        "image": "assets/images/planningProgramming.jpg",
        "title": context.translator.homeItem3
      },
      {
        "image": "assets/images/fitnessIndicator.jpg",
        "title": context.translator.homeItem4
      }, //item4.png
    ];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() {
        return homeController.isLoading.value
            ? HomeShimmer(size: size)
            : Stack(
                children: [
                  backgroundImage(context),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(11, 5, 11, 5),
                    child: SafeArea(
                      child: Column(
                        children: [
                          //todo -------------> appbar
                          MyAppBar(),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     //todo --------------------> logo image
                                  //     Image.asset(
                                  //       "assets/images/logo.png",
                                  //       width: size.width / 2.5,
                                  //       height: 60,
                                  //       fit: BoxFit.fill,
                                  //     ),
                                  //     //todo --------------------> all last images
                                  //     Row(
                                  //       mainAxisSize: MainAxisSize.min,
                                  //       children: [
                                  //         InkWell(
                                  //           onTap: () {
                                  //             Get.toNamed('/training-screen');
                                  //           },
                                  //           child: Image.asset(
                                  //             "assets/images/tool.png",
                                  //             width: 30,
                                  //             height: 30,
                                  //             fit: BoxFit.fill,
                                  //           ),
                                  //         ),
                                  //         Gap(9),
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
                                  //         Gap(6),
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
                                  //todo -------------> contents
                                  Gap(size.height * 0.014),
                                  //todo -------------> Carousel slider
                                  // CarouselSlider(
                                  //   items: List.generate(
                                  //     _bannerImages.length,
                                  //     (index) => Container(
                                  //       decoration: BoxDecoration(
                                  //         image: DecorationImage(
                                  //             image: AssetImage(_bannerImages[index]),
                                  //             fit: BoxFit.cover),
                                  //         border: Border.all(
                                  //             color: darkMode.value
                                  //                 ? Colors.white70
                                  //                 : Colors.black),
                                  //         borderRadius: BorderRadius.circular(15),
                                  //       ),
                                  //     ),
                                  //   ),
                                  //   // homeController.bannerList
                                  //   //     .map(
                                  //   //       (item) => InkWell(
                                  //   //         onTap: () async {
                                  //   //           // myLog(homeController.bannerList.toString());
                                  //   //           if (await canLaunchUrl(
                                  //   //               Uri.parse(item.bannerUrl))) {
                                  //   //             await launchUrl(
                                  //   //                 Uri.parse(item.bannerUrl));
                                  //   //           }
                                  //   //         },
                                  //   //         child: Container(
                                  //   //           margin: const EdgeInsets.symmetric(
                                  //   //               horizontal: 5),
                                  //   //           decoration: BoxDecoration(
                                  //   //             border: Border.all(
                                  //   //                 color: darkMode.value
                                  //   //                     ? Colors.white60
                                  //   //                     : Colors.black),
                                  //   //             borderRadius:
                                  //   //                 BorderRadius.circular(15),
                                  //   //           ),
                                  //   //           child: Image.network(
                                  //   //             mainUrl +
                                  //   //                 bannerUrl +
                                  //   //                 item.bannerImage,
                                  //   //             width: size.width,
                                  //   //             fit: BoxFit.cover,
                                  //   //           ),
                                  //   //         ),
                                  //   //       ),
                                  //   //     ).toList(),
                                  //   options: CarouselOptions(
                                  //     enlargeCenterPage: true,
                                  //     viewportFraction: 0.8,
                                  //     //todo ------------> banner getting height from here
                                  //     height: size.height * 0.215,
                                  //     // 6,
                                  //     autoPlay: true,
                                  //     scrollDirection: Axis.horizontal,
                                  //   ),
                                  // ),
                                  MyCarouselSlider(bannerImages: _bannerImages),
                                  Gap(size.height * 0.014),
                                  //todo ---------------------> Feed text
                                  Text(
                                    context.translator.homeContent,
                                    //translator.getString("Home.content"),
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge!.copyWith(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                            ),
                                  ),
                                  Gap(size.height * 0.014),
                                  ResponsiveGridList(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    minItemWidth: size.width / 2.5,
                                    children: List.generate(
                                      items.length,
                                      (i) => Item(
                                        image: items[i]['image'],
                                        title: items[i]['title'],
                                        onTap: () async {
                                          if (i == 0) {
                                            Get.toNamed('/trainingScreen');
                                            // var page = await Navigator.of(context)
                                            //     .pushNamed(
                                            //   EntertainmentScreen.routeName,
                                            // );
                                          } else if (i == 1) {
                                            Get.toNamed(
                                              '/nutrition-screen',
                                            );
                                            // var page = await Navigator.of(context)
                                            //     .pushNamed(
                                            //   SportNutritionScreen.routeName,
                                            // );
                                            // widget.changeTab(page as int);
                                          } else if (i == 2) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PlanningAndProgramming()),
                                            );
                                            // var page = await Navigator.of(context)
                                            //     .pushNamed(
                                            //   BodyCompositionScreen.routeName,
                                            // );
                                            // widget.changeTab(page as int);
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => PlanScree()
                                                  // ComingSoon(),
                                                  ),
                                            );
                                          }
                                        },
                                      ),
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
              );
      }),
    );
  }

  Container myLoader(Widget child) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border:
              Border.all(color: darkMode.value ? Colors.white70 : Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child);
  }
}
