import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportperformance/Components/Empty.dart';
import 'package:sportperformance/Components/MyLoading.dart';
import 'package:sportperformance/Components/MyNetworkError.dart';
import 'package:sportperformance/Components/MyPlan.dart';
import 'package:sportperformance/controllers/plannig_controller.dart';
import 'package:sportperformance/main.dart';
import 'package:flutter_translator/flutter_translator.dart';

class PlanListScreen extends StatefulWidget {
  static const routeName = "PlanListScreen";
  @override
  State<PlanListScreen> createState() => _PlanListScreenState();
}

class _PlanListScreenState extends State<PlanListScreen> {
  final controller = Get.put(PlanningController());
  final translator = TranslatorGenerator.instance;
  final List<Map<String, dynamic>> tabs = [
    {"title": "Main.tab1", "icon": "assets/images/home.png"},
    {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
    {"title": "Main.tab3", "icon": "assets/images/settings.png"},
    {"title": "Main.tab4", "icon": "assets/images/profile.png"},
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
                  ],
                ),
                const SizedBox(height: 25),
                Obx(() {
                  return Expanded(
                    child: controller.isLoading.value
                        ? const MyLoading()
                        : controller.showError.value
                            ? const MyNetworkError()
                            : controller.plan.coachId == null
                                ? Empty()
                                : SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          translator
                                              .getString("PlanList.title"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        const SizedBox(height: 30),
                                        MyPlan(controller.plan),
                                      ],
                                    ),
                                  ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 30,
        currentIndex: 1,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
