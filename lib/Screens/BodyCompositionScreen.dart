import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/DatePart.dart';
import 'package:sportperformance/Components/GraphPart.dart';
import 'package:sportperformance/Components/SelectTab.dart';
import 'package:sportperformance/Components/StudentsPart.dart';
import 'package:sportperformance/Utils/Color.dart';
import 'package:sportperformance/main.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:sportperformance/Screens/NotificationScreen.dart';

import '../Components/OldDataStudentPart.dart';

class BodyCompositionScreen extends StatefulWidget {
  static const routeName = "BodyCompositionScreen";
  @override
  State<BodyCompositionScreen> createState() => _BodyCompositionScreenState();
}

class _BodyCompositionScreenState extends State<BodyCompositionScreen> {
  final translator = TranslatorGenerator.instance;
  final List<Map<String, dynamic>> tabs = [
    {"title": "Main.tab1", "icon": "assets/images/home.png"},
    {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
    {"title": "Main.tab3", "icon": "assets/images/settings.png"},
    {"title": "Main.tab4", "icon": "assets/images/profile.png"},
  ];

  int selected = 0;
  List pages = [
    StudentsPart(),
    GraphPart(),
    DatePart(),
    OldDataStudentsPart(),
  ];

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
                                Get.toNamed('/goal-screen');
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
                            Get.toNamed('/goal-screen');
                          },
                          child: Text(
                            'Goal',
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
                Text(
                  translator.getString("BodyCompo.title"),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SelectTab(
                          title: "BodyCompo.option1",
                          index: "0",
                          selected: selected.toString(),
                          onTap: () {
                            selected = 0;
                            setState(() {});
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SelectTab(
                          title: "BodyCompo.option2",
                          index: "1",
                          selected: selected.toString(),
                          onTap: () {
                            selected = 1;
                            setState(() {});
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SelectTab(
                          title: "BodyCompo.option3",
                          index: "2",
                          selected: selected.toString(),
                          onTap: () {
                            selected = 2;
                            setState(() {});
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SelectTab(
                          title: "BodyCompo.option4",
                          index: "3",
                          selected: selected.toString(),
                          onTap: () {
                            selected = 3;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(child: pages[selected]),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconSize: 30,
        selectedItemColor: Theme.of(context).primaryColorLight,
        unselectedItemColor: Colors.grey,
        onTap: (page) => Navigator.of(context).pop(page),
        items: List.generate(
          tabs.length,
          (index) => BottomNavigationBarItem(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            icon: ImageIcon(AssetImage(tabs[index]['icon'])),
            label: translator.getString(tabs[index]['title']),
          ),
        ),
      ),
    );
  }
}
