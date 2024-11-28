import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/ComingSoon.dart';
import 'package:sportperformance/Screens/PlanScreen.dart';
import 'package:sportperformance/Screens/shimmer/home_shimmer.dart';
import 'package:sportperformance/Utils/Color.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/controllers/home/homeTab_controller.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Components/Item.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:sportperformance/Responsive%20Grid%20Package/responsive_grid_list.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  final Function(int page) changeTab;

  const HomeScreen(this.changeTab);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeScreenController());

  final translator = TranslatorGenerator.instance;
  List<Map<String, dynamic>> items = [
    {'image': 'assets/images/item1.png', 'title': 'Home.item1'},
    {'image': 'assets/images/item22.jpg', 'title': 'Home.item2'},
    {'image': 'assets/images/item33.jpg', 'title': 'Home.item3'},
    // {'image': 'assets/images/item4.png', 'title': 'Home.item4'},
  ];
  changeTab(int page) {
    currentPage = page;
    setState(() {});
  }

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Obx(() {
        return homeController.isLoading.value
            ? HomeShimmer(size: size)
            : Stack(
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
                            //--------------------> logo image
                            Image.asset(
                              "assets/images/logo.png",
                              width: size.width / 2.5,
                              height: 60,
                              fit: BoxFit.fill,
                            ),
                            //--------------------> all last images
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
                                          ),
                                        );
                                        //Get.toNamed('/goal-screen');
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
                                          builder: (context) =>
                                              PlanScree(changeTab),
                                        ));
                                    //Get.toNamed('/goal-screen');
                                  },
                                  child: Text(
                                    translator.getString("Plan.title2"),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontSize: 14,
                                          color: primaryColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
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
                                // ---------------------> CarouselSlider
                                CarouselSlider(
                                  items: homeController.bannerList
                                      .map(
                                        (item) => InkWell(
                                          onTap: () async {
                                            if (await canLaunchUrl(
                                                Uri.parse(item.bannerUrl))) {
                                              await launchUrl(Uri.parse(item.bannerUrl));
                                            }
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                mainUrl + bannerUrl + item.bannerImage,
                                                width: size.width,
                                                height: size.height / 6,
                                                fit: BoxFit.cover,
                                              ),
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
                                // -------------> Content text
                                Text(
                                  translator.getString("Home.content"),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                ResponsiveGridList(
                                  shrinkWrap: true,
                                  minItemWidth: size.width / 2.5,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: List.generate(
                                    items.length,
                                    (i) => Item(
                                      image: items[i]['image'],
                                      title: translator
                                          .getString(items[i]['title']),
                                      onTap: () async {
                                        if (i == 0) {
                                          Get.toNamed(
                                            '/entertainment-screen',
                                          );
                                          // var page = await Navigator.of(context)
                                          //     .pushNamed(
                                          //   EntertainmentScreen.routeName,
                                          // );
                                          // widget.changeTab(page as int);
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
                                          Get.toNamed(
                                            '/body-composition-screen',
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
                                                builder: (context) =>
                                                    ComingSoon(),
                                              ));
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
      }),
    );
  }
}