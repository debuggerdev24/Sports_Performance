import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Screens/HomeScreen.dart';
import 'package:sportperformance/Screens/ToolsScreen.dart';
import 'package:sportperformance/Screens/ProfileScreen.dart';
import 'package:sportperformance/extensions/context_extension.dart';

import '../controllers/main_screen_controller.dart';
import 'PaymentScreen.dart';

class MainScreen extends StatefulWidget {
  final int currentPage;
  static const routeName = "MainScreen";

  const MainScreen(this.currentPage);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Map<String, dynamic>> tabs;
  int currentPage = 0;
  final _key = GlobalKey<ScaffoldState>();

  List pages = [
    HomeScreen(),
    ToolsScreen(),
    PaymentScreen(),
    ProfileScreen(),
  ];

  @override
  void initState(){
    super.initState();
    currentPage = widget.currentPage;
    setState(() {});
  }

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


  @override
  Widget build(BuildContext context) {
    final mainscreenController = Get.put(MainScreenController(context));//todo Get.arguments[0]
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

    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // );
    return Scaffold(
      key: _key,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: pages[currentPage],
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
            label: tabs[index]['title'],
          ),
        ),
      ),
    );
  }
}
