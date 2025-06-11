import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/components/my_carousel_slider.dart';
import 'package:sportperformance/controllers/home/homeTab_controller.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/responsive_grid_package/responsive_grid_list.dart';
import '../Components/MyCardView.dart';
import '../utils/global.dart';

class PlanScree extends StatefulWidget {
  // final Function(int page) changeTab;

  const PlanScree();

  @override
  State<PlanScree> createState() => _PlanScreeState();
}

class _PlanScreeState extends State<PlanScree> {
  final homeController = Get.put(HomeScreenController());

  // //final translator = TranslatorGenerator.instance;

  String selectedPlan1 = "";
  late List<Map<String, dynamic>> items;
  int currentPage = 0;

  changeTab(int page) {
    currentPage = page;
    setState(() {});
  }

  late List<Map<String, dynamic>> tabs = [];

  String selectedPlan2 = "Plam 6 Meses";
  List plan2 = [
    "Plan 3 Meses",
    "Plam 6 Meses",
    "Plan Deportes",
    "Plan Alto Rendimiento",
  ];

  List<String> bannerImages = [
    "assets/images/banners/indicator/i_1.jpg",
    "assets/images/banners/indicator/i_2.jpg",
    "assets/images/banners/indicator/i_3.jpg",
    "assets/images/banners/indicator/i_4.jpg",
    "assets/images/banners/indicator/i_5.jpg",
    "assets/images/banners/indicator/i_6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    tabs = [
      {"title": context.translator.mainTab1, "icon": "assets/images/home.png"},
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
      // {'image': 'assets/images/plan.jpeg', 'title': 'Plan.item1'},
      {
        'image': "assets/images/indicator/metric.jpg",
        'title': context.translator.planItem2
      },
      {
        'image': "assets/images/indicator/bodyComposition.png",
        'title': context.translator.planItem4
      }, //item33.jpg
      {
        'image': "assets/images/indicator/strength.jpg", //strength.jpg',
        'title': context.translator.strengthTitle
      },
      {
        'image': "assets/images/indicator/limitation_img.jpg",
        'title': context.translator.limitationTitle
      },
      {'image': "assets/images/indicator/fms.jpg", "title": "FMS"},//assets/images/indicator/fms_image.jpg
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 11, 5),
              child: Column(
                children: [
                  //todo -----------------------> appbar
                  const MyAppBar(),
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
                          //             Get.toNamed('/plan&programing');
                          //           },
                          //           child: Image.asset(
                          //             darkMode.value
                          //                 ? "assets/images/plans_darkmode.png"
                          //                 : "assets/images/plans.png",
                          //             //"assets/images/tool.png",
                          //             height: 25,
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
                          //             //"assets/images/notification.png",
                          //             height: 28,
                          //             fit: BoxFit.fill,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                          Gap(size.height * 0.014),
                          // CarouselSlider(
                          //   items: List.generate(
                          //     bannerImages.length,
                          //         (index) => Container(
                          //       decoration: BoxDecoration(
                          //         image: DecorationImage(image: AssetImage(bannerImages[index]),fit: BoxFit.cover),
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
                          //     scrollPhysics: BouncingScrollPhysics(),
                          //     enlargeCenterPage: true,
                          //     viewportFraction: 0.8,
                          //     //todo ------------> banner getting height from here
                          //     height: size.height * 0.215,
                          //     // 6,
                          //     autoPlay: true,
                          //     scrollDirection: Axis.horizontal,
                          //   ),
                          // ),
                          MyCarouselSlider(bannerImages: bannerImages),
                          Gap(size.height * 0.014),
                          //todo ------------------------> title
                          Text(
                            context.translator.indicatorTitle,
                            //translator.getString("Indicator.Indicator"),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Gap(size.height * 0.014),
                          //todo -----------------> all items
                          ResponsiveGridList(
                            physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              minItemWidth: size.width * 0.35,
                              horizontalGridMargin: 12,
                              horizontalGridSpacing: 30,
                              verticalGridSpacing: 25,
                              maxItemsPerRow: 2,
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
                                        await Get.toNamed('/metric-screen');
                                      } else if (i == 1) {
                                        await Get.toNamed('/body-composition-screen');
                                      } else if (i == 2) {
                                        await Get.toNamed("/strengthScreen");
                                      } else if (i == 3) {
                                        await Get.toNamed("/limitationScreen");
                                      } else if (i == 4) {
                                        await Get.toNamed("/fmsScreen");
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
                              )),
                          // Wrap(
                          //   spacing: 15,
                          //   runSpacing: 15,
                          //   children: List.generate(
                          //     items.length,
                          //     (i) => MyCard(
                          //       name: items[i]['title'],
                          //       image: items[i]['image'],
                          //       selected: items[selectedItem]['title'],
                          //       onTap: () async {
                          //
                          //         try {
                          //           if (i == 0) {
                          //             var page =
                          //                 await Get.toNamed('/metric-screen');
                          //           } else if (i == 1) {
                          //             var page = await Get.toNamed(
                          //                 '/body-composition-screen');
                          //           }
                          //         } catch (e) {
                          //           myLog("Navigation error: $e");
                          //         }
                          //         setState(() {
                          //           selectedItem = i;
                          //         });
                          //         // if(i == 0){
                          //         //   var page = await Get.toNamed('/metric-screen');
                          //         //     widget.changeTab(page as int);
                          //         //   log(page.toString());
                          //         // }
                          //         // else if(i == 1){
                          //         //   var page = await Get.toNamed('/body-composition-screen');
                          //         //   widget.changeTab(page as int);
                          //         //   log(page.toString());
                          //         // }
                          //         // if (i == 0) {
                          //         //   var page =
                          //         //       await Get.toNamed('/plan-list-screen');
                          //         //   widget.changeTab(page as int);
                          //         // } else if (i == 1) {
                          //         //   var page =
                          //         //       await Get.toNamed('/metric-screen');
                          //         //   widget.changeTab(page as int);
                          //         // } else if (i == 2) {
                          //         //   var page =
                          //         //       await Get.toNamed('/equipment-screen');
                          //         //   widget.changeTab(page as int);
                          //         // }
                          //       },
                          //     ),
                          //   ),
                          // ),

                          // const SizedBox(height: 25),
                          // Text(
                          //   translator.getString("Plan.title2"),
                          //   textAlign: TextAlign.center,
                          //   style:
                          //       Theme.of(context).textTheme.bodyLarge!.copyWith(
                          //             fontSize: 18,
                          //             fontWeight: FontWeight.w600,
                          //           ),
                          // ),
                          // Container(
                          //   transform: Matrix4.translationValues(0, -15, 0),
                          //   child: ResponsiveGridList(
                          //     shrinkWrap: true,
                          //     physics: const NeverScrollableScrollPhysics(),
                          //     minItemWidth: size.width / 2.5,
                          //     children: List.generate(
                          //       plan2.length,
                          //       (i) => Plan2(
                          //         title: plan2[i],
                          //         isVip: i == 1 ? true : false,
                          //         selected: selectedPlan2,
                          //         onTap: () {
                          //           selectedPlan2 = plan2[i];
                          //           setState(() {});
                          //           Utils.showMyBottomSheet(
                          //             context,
                          //             StartPlan(
                          //               title: plan2[i],
                          //               subTitle:
                          //                   'Este plan de asesoría incluye\n\n- Sesión de evaluación presencial y anamnesis\n- Una periodización de fuerza por 12 semanas\n- Videos demostrativos de cada ejercicio\n- Plan de alimentación personalizado',
                          //             ),
                          //           );
                          //         },
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(tabs: tabs)
    );
  }
}

//BottomNavigationBar(
//         elevation: 0,
//         selectedFontSize: 10,
//         unselectedFontSize: 10,
//         showUnselectedLabels: true,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         iconSize: 30,
//         selectedItemColor: Theme.of(context).primaryColorLight,
//         unselectedItemColor: Colors.grey,
//         onTap: (page) => Get.to(MainScreen(page)),
//         //todo Navigator.of(context).pop(page),
//         items: List.generate(
//           4,
//           (index) => BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             icon: ImageIcon(AssetImage(tabs[index]['icon'])),
//             label: tabs[index]['title'],
//           ),
//         ),
//       ),

int selectedItem = 0;


// CarouselSlider(
//   items: List.generate(
//     bannerImages.length,
//         (index) => Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(image: AssetImage(bannerImages[index]),fit: BoxFit.cover),
//         border: Border.all(
//             color: darkMode.value
//                 ? Colors.white60
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
//     animateToClosest: true,
//     scrollPhysics: BouncingScrollPhysics(),
//     enableInfiniteScroll: false,
//     enlargeCenterPage: true,
//     viewportFraction: 0.8,
//     //todo ------------> banner getting height from here
//     height: size.height * 0.215,
//     // 6,
//     autoPlay: true,
//     scrollDirection: Axis.horizontal,
//   ),
// ),
