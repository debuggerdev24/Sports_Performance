import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import '../utils/global.dart';
import 'MainScreen.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  late List<Map<String, dynamic>> tabs, items;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    tabs = [
      {
        "title": context.translator.mainTab1,
        "icon": "assets/images/home.png",
      },
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Image.asset(
                  //       "assets/images/logo.png",
                  //       width: size.width / 2.5,
                  //       height: 60,
                  //       fit: BoxFit.fill,
                  //     ),
                  //     Column(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Row(
                  //           spacing: 8,
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: [
                  //             InkWell(
                  //               onTap: () {
                  //                 Get.toNamed('/entertainment-screen');
                  //               },
                  //               child: Image.asset(
                  //                 "assets/images/tool.png",
                  //                 width: 30,
                  //                 height: 30,
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //             InkWell(
                  //               onTap: () {
                  //                 Get.toNamed('/plan&programing');
                  //               },
                  //               child: Image.asset(
                  //                 darkMode.value
                  //                     ? "assets/images/plans_darkmode.png"
                  //                     : "assets/images/plans.png",
                  //                 height: 25,
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //             InkWell(
                  //               onTap: () {
                  //                 Get.toNamed('/notification');
                  //               },
                  //               child: Image.asset(
                  //                 darkMode.value
                  //                     ? "assets/images/notifi_darkmode.png"
                  //                     : "assets/images/notifi.png",
                  //                 height: 28,
                  //                 fit: BoxFit.fill,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  const MyAppBar(),
                  Gap(size.height * 0.014),
                  Expanded(
                    child: Stack(
                      children: [
                        InAppWebView(
                          initialUrlRequest: URLRequest(
                            url: WebUri(
                                "https://www.termsfeed.com/live/25cc7450-6aae-48e3-834f-532de338c510"), //https://sportsperformance.cl/educacion/privacy-policy.php
                          ), //https://www.termsfeed.com/live/fe6774bf-be5c-4d87-9ffd-d1fce4c8eecf
                          onLoadStart: (controller, url) {
                            setState(() {
                              _isLoading = true;
                            });
                          },
                          onLoadStop: (controller, url) async {
                            setState(() {
                              _isLoading = false;
                            });
                          },
                        ),
                        _isLoading
                            ? Center(child: myIndicator(context))
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 30,
        currentIndex: 2,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).primaryColorLight,
        onTap: (page) =>
            Get.to(MainScreen(page)), // Navigate to the selected screen
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
