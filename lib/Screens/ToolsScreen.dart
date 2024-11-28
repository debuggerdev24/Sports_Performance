import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/ComingSoon.dart';
import 'package:sportperformance/Screens/AudioBookScreen.dart';
import 'package:sportperformance/Screens/EntertainmentScreen.dart';
import 'package:sportperformance/Screens/PlanScreen.dart';
import 'package:sportperformance/Screens/YoutuebChannelScreen.dart';
import 'package:sportperformance/Screens/workout_detail_screen.dart';
import 'package:sportperformance/Utils/Color.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Components/ToolsItem.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:sportperformance/Screens/NotificationScreen.dart';
import 'package:sportperformance/Screens/VidoeTraninigScreen.dart';

class ToolsScreen extends StatefulWidget {
  final Function(int page) changeTab;

  const ToolsScreen(this.changeTab);
  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  final translator = TranslatorGenerator.instance;
  int currentPage = 0;
  List<Map<String, dynamic>> items = [
    {'image': 'assets/images/item1.png', 'title': 'Tools.option1'},
    // {'image': 'assets/images/item2.png', 'title': 'Tools.option2'},
    // {'image': 'assets/images/item3.png', 'title': 'Tools.option3'},
    // {'image': 'assets/images/youtube.png', 'title': 'Tools.option4'},
    // {'image': 'assets/images/item4.png', 'title': 'Tools.option5'},
  ];
  changeTab(int page) {
    currentPage = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
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
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
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
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PlanScree(changeTab),
                                    ));
                                // Get.toNamed('/goal-screen');
                              },
                              child: Image.asset(
                                "assets/images/tool.png",
                                width: 30,
                                height: 30,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Get.toNamed('/notification');
                              },
                              child: Image.asset(
                                "assets/images/notification.png",
                                width: 25,
                                height: 25,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlanScree(changeTab),
                                ));
                            //Get.toNamed('/goal-screen');
                          },
                          child: Text(
                            translator.getString("Plan.title2"),
                            //'Goal',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          items: items
                              .map(
                                (item) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      "assets/images/banner2.png",
                                      width: size.width,
                                      height: size.height / 6,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            height: size.height / 6,
                            viewportFraction: 1,
                            autoPlay: true,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          translator.getString("Tools.title"),
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, -15, 0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: items.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (ctx, i) => ToolsItem(
                              title: translator.getString(items[i]['title']),
                              image: items[i]['image'],
                              onTap: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EntertainmentScreen(),
                                    ));
                                // if (i == 0) {
                                //   var page =
                                //       await Navigator.of(context).pushNamed(
                                //     VidoeTraninigScreen.routeName,
                                //     arguments: {
                                //       'title': translator
                                //           .getString(items[i]['title']),
                                //       'image': items[i]['image'],
                                //     },
                                //   );
                                //   widget.changeTab(page as int);
                                // } else if (i == 3) {
                                //   var page =
                                //       await Navigator.of(context).pushNamed(
                                //     YoutubeChannelScreen.routeName,
                                //     arguments: {
                                //       'subTitle':
                                //           translator.getString("Tools.title"),
                                //       'title': translator
                                //           .getString(items[i]['title']),
                                //       'image': items[i]['image'],
                                //     },
                                //   );
                                //   widget.changeTab(page as int);
                                // } else if (i == 4) {
                                //   var page =
                                //       await Navigator.of(context).pushNamed(
                                //     AudioBookScreen.routeName,
                                //     arguments: {
                                //       'subTitle':
                                //           translator.getString("Tools.title"),
                                //       'title': translator
                                //           .getString(items[i]['title']),
                                //       'image': items[i]['image'],
                                //     },
                                //   );
                                //   widget.changeTab(page as int);
                                // }
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
          )
        ],
      ),
    );
  }
}
