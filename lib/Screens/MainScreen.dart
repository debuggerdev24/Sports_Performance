import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Screens/HomeScreen.dart';
import 'package:sportperformance/Screens/PlanScreen.dart';
import 'package:sportperformance/Screens/ToolsScreen.dart';
import 'package:sportperformance/Screens/ProfileScreen.dart';

import '../controllers/main_screen_controller.dart';

class MainScreen extends StatefulWidget {
  static const routeName = "MainScreen";
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final mainscreenController = Get.put(MainScreenController(Get.arguments[0]));

  final translator = TranslatorGenerator.instance;
  final _key = GlobalKey<ScaffoldState>();
  final List<Map<String, dynamic>> tabs = [
    {"title": "Main.tab1", "icon": "assets/images/home.png"},
    {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
    {"title": "Main.tab3", "icon": "assets/images/settings.png"},
    {"title": "Main.tab4", "icon": "assets/images/profile.png"},
  ];

  changeTab(int page) {
    currentPage = page;
    setState(() {});
  }

  toggleDrawer() {
    if (_key.currentState!.isDrawerOpen) {
      _key.currentState!.closeDrawer();
    } else {
      _key.currentState!.openDrawer();
    }
  }

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List pages = [
      HomeScreen(changeTab),
      PlanScree(changeTab),
      ToolsScreen(changeTab),
      ProfileScreen(),
    ];
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      key: _key,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: pages[currentPage],
      // drawer: MyDrawer(toggleDrawer),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        currentIndex: currentPage,
        iconSize: 30,
        selectedItemColor: Theme.of(context).primaryColorLight,
        unselectedItemColor: Colors.grey,
        onTap: changeTab,
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
