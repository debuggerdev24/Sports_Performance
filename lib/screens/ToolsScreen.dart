import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Screens/MainScreen.dart';
import 'package:sportperformance/components/my_carousel_slider.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Components/ToolsItem.dart';
import 'package:sportperformance/utils/global.dart';

class ToolsScreen extends StatefulWidget {

  const ToolsScreen();

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  // //final translator = TranslatorGenerator.instance;

  int currentPage = 0;
  List<Map<String, dynamic>> items = [];

  List<String> bannerImages = [
    "assets/images/banners/tools/t_1.jpeg",
    "assets/images/banners/tools/t_2.jpg",
    "assets/images/banners/tools/t_3.jpg",
    "assets/images/banners/tools/t_4.jpg",
    "assets/images/banners/tools/t_5.jpg",
    "assets/images/banners/tools/t_6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    items = [
      {
        'image': 'assets/images/item1.png',
        'title': "${context.translator.toolsOption1}"
      }, //'Tools.option1'
      {
        'image': 'assets/images/item2.png',
        'title': "${context.translator.toolsOption2}"
      },
      {
        'image': 'assets/images/item3.png',
        'title': "${context.translator.toolsOption3}"
      },
      {
        'image': 'assets/images/youtube.png',
        'title': "${context.translator.toolsOption4}"
      },
      {
        'image': 'assets/images/item4.png',
        'title': "${context.translator.toolsOption5}"
      },
    ];
    var size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.offAll(MainScreen(0));
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            backgroundImage(context),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 5, 11, 5),
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
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(size.height * 0.018),
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
                            Gap(size.height * 0.018),
                            Text(
                              context.translator.toolsTitle,
                              //translator.getString("Tools.title"),
                              style:
                                  Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                            ),
                            Gap(size.height * 0.025),
                            Container(
                              transform: Matrix4.translationValues(0, -15, 0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: items.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, i) => ToolsItem(
                                  title: items[i]['title'],
                                  image: items[i]['image'],
                                  onTap: () async {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           EntertainmentScreen(),
                                    //     ));
                                    if (i == 0) {
                                      try {
                                         await Get.toNamed(
                                          "/vidoe-traninig-screen",
                                          arguments: {
                                            'subTitle':
                                                context.translator.toolsTitle,
                                            'title': items[i]['title'],
                                            'image': items[i]['image'],
                                          },
                                        );
                                        // var page =
                                        // await Navigator.of(context).
                                        // pushNamed(
                                        //   VidoeTraninigScreen.routeName,
                                        //   arguments: {
                                        //     'subTitle': context.translator.toolsTitle,
                                        //     'title': items[i]['title'],
                                        //     'image': items[i]['image'],
                                        //   },
                                        // );
                                      } catch (e, s) {
                                        log(e.toString());
                                      }
                                    }
                                    else if(i == 1){
                                      await Get.toNamed(
                                        "/toolsScreen",
                                        arguments: {
                                          'subTitle': context.translator.toolsTitle,
                                          'title': items[i]['title'],
                                          'image': items[i]['image'],
                                        },
                                      );
                                    }
                                    else if(i == 2){
                                      await Get.toNamed(
                                        "/tipsScreen",
                                        arguments: {
                                          'subTitle': context.translator.toolsTitle,
                                          'title': items[i]['title'],
                                          'image': items[i]['image'],
                                        },
                                      );
                                    }
                                    else if (i == 3) {
                                      await Get.toNamed(
                                        "/youtube-channel-screen",
                                        arguments: {
                                          'subTitle': context.translator.toolsTitle,
                                          'title': items[i]['title'],
                                          'image': items[i]['image'],
                                        },
                                      );
                                      // Navigator.of(context).pushNamed(
                                      //   YoutubeChannelScreen.routeName,
                                      //   arguments: {
                                      //     'subTitle': context.translator.toolsTitle,
                                      //     //translator.getString("Tools.title"),
                                      //     'title': items[i]['title'],
                                      //     'image': items[i]['image'],
                                      //   },
                                      // );
                                      // widget.changeTab(page as int);
                                    } else if (i == 4) {
                                      var page = await Get.toNamed(
                                        "/audio-book-screen",
                                        arguments: {
                                          'subTitle':
                                              context.translator.toolsTitle,
                                          'title': items[i]['title'],
                                          'image': items[i]['image'],
                                        },
                                      );
                                      //     await Navigator.of(context).pushNamed(
                                      //   AudioBookScreen.routeName,
                                      //   arguments: {
                                      //     'subTitle': context.translator.toolsTitle,
                                      //     //translator.getString("Tools.title"),
                                      //     'title': items[i]['title'],
                                      //     'image': items[i]['image'],
                                      //   },
                                      // );
                                      // widget.changeTab(page as int);
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
            )
          ],
        ),
      ),
    );
  }
}
