import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/ToolInnerCategoryItem.dart';
import 'package:sportperformance/Components/YoutubeVideo.dart';
import 'package:sportperformance/Utils/utils.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/Components/ToolsItem.dart';
import 'package:sportperformance/utils/global.dart';
import 'MainScreen.dart';

class YoutubeChannelScreen extends StatefulWidget {
  static const routeName = 'YoutubeChannelScreen';

  @override
  State<YoutubeChannelScreen> createState() => _YoutubeChannelScreenState();
}

class _YoutubeChannelScreenState extends State<YoutubeChannelScreen> {

  late String title;
  late String subTitle;
  late String image;

  final List<Map<String, dynamic>> categories = [
    {
      "title": "Exercises with Jumping Rope",
      "image": "assets/images/exercise1.png"
    },
    {
      "title": "Exercises with Jumping Rope",
      "image": "assets/images/exercise2.png"
    },
    {
      "title": "Exercises with Jumping Rope",
      "image": "assets/images/exercise3.png"
    },
  ];

  late List<Map<String, dynamic>> tabs;

  @override
  void didChangeDependencies() {
    Map arg = ModalRoute.of(context)!.settings.arguments as Map;
    title = arg['title'];
    subTitle = arg['subTitle'];
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //todo ---------------> appbar
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
                  //     //     SizedBox(width: 9),
                  //     //     InkWell(
                  //     //       onTap: () {
                  //     //         Get.toNamed('/nu');//plan&programing
                  //     //       },
                  //     //       child: Image.asset(
                  //     //         darkMode.value
                  //     //             ? "assets/images/plans_darkmode.png"
                  //     //             : "assets/images/plans.png", //"assets/images/trools.png",
                  //     //         height: 26,
                  //     //         fit: BoxFit.fill,
                  //     //       ),
                  //     //     ),
                  //     //     SizedBox(width: 6),
                  //     //     InkWell(
                  //     //       onTap: () {
                  //     //         Get.toNamed('/notification');
                  //     //       },
                  //     //       child: Image.asset(
                  //     //         darkMode.value
                  //     //             ? "assets/images/notifi_darkmode.png"
                  //     //             : "assets/images/notifi.png",
                  //     //         //"assets/images/notification.png",
                  //     //         height: 28,
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
                  //         const SizedBox(width: 9),
                  //         InkWell(
                  //           onTap: () {
                  //             Get.toNamed('/goal-screen');
                  //           },
                  //           child: Image.asset(
                  //             darkMode.value
                  //                 ? "assets/images/plans_darkmode.png"
                  //                 : "assets/images/plans.png", //"assets/images/trools.png",
                  //             height: 26,
                  //             fit: BoxFit.fill,
                  //           ),
                  //         ),
                  //         const SizedBox(width: 6),
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
                  Gap(size.height * 0.014),
                  Text(
                    //subTitle,
                    context.translator.videos,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Gap(size.height * 0.014),
                  ToolsItem(
                    title: title,
                    image: image,
                  ),
                  const Gap(5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 08),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: categories.length,
                        itemBuilder: (ctx, i) => ToolInnerCategoryItem(
                          image: categories[i]['image'],
                          title: categories[i]['title'],
                          onTap: () {
                            Utils.showMyDialog(
                              context,
                              const YoutubeVideo(
                                "https://www.youtube.com/watch?v=fLLScgWQcHc",
                                true,
                              ),
                              padding: EdgeInsets.zero,
                            );
                          },
                        ),
                        separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.grey,height: size.height * 0.04),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(tabs: tabs,index: 1),
      // BottomNavigationBar(
      //   elevation: 0,
      //   iconSize: 30,
      //   currentIndex: 1,
      //   selectedFontSize: 10,
      //   unselectedFontSize: 10,
      //   showUnselectedLabels: true,
      //   unselectedItemColor: Colors.grey,
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   selectedItemColor: Theme.of(context).primaryColorLight,
      //   onTap: (page) => Get.to(MainScreen(page)),//todo  Navigator.of(context).pop(page),
      //   items: List.generate(
      //     tabs.length,
      //         (index) => BottomNavigationBarItem(
      //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //       icon: ImageIcon(AssetImage(tabs[index]['icon'])),
      //       label: tabs[index]['title'],
      //     ),
      //   ),
      // ),
    );
  }
}


