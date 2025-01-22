import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/extensions/context_extension.dart';

import '../Screens/HomeScreen.dart';
import '../Screens/MainScreen.dart';
import '../Screens/PaymentScreen.dart';
import '../Screens/ProfileScreen.dart';
import '../Screens/ToolsScreen.dart';
import '../main.dart';

List pages = [
  HomeScreen(),
  ToolsScreen(),
  PaymentScreen(),
  ProfileScreen(),
];

String publishKey = "pk_test_SXBwRRvbVwgxBhVLmCIswB3Y00ThG9QkYX";
String secretKey = "sk_test_8Bj4c8qCQz9U90pAR25E7v6k00JuAnfax5";

Container backgroundImage(BuildContext context){
  return Container(
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
  );
}

BottomNavigationBar myBottomNavBar(BuildContext context, List tabs) {
  return BottomNavigationBar(
    elevation: 0,
    selectedFontSize: 12,
    unselectedFontSize: 10,
    showUnselectedLabels: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    iconSize: 30,
    selectedItemColor: Theme.of(context).primaryColorLight,
    unselectedItemColor: Colors.grey,
    onTap: (page) => Get.to(MainScreen(page)),//todo Navigator.of(context).pop(page),
    items: List.generate(
      tabs.length,
          (index) => BottomNavigationBarItem(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        icon: ImageIcon(AssetImage(tabs[index]['icon'])),
        label: tabs[index]['title'],
      ),
    ),
  );
}

class MyBottomNavBar extends StatelessWidget {
  final List tabs;
  MyBottomNavBar({super.key, required this.tabs});


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      showUnselectedLabels: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      iconSize: 30,
      selectedItemColor: Theme.of(context).primaryColorLight,
      unselectedItemColor: Colors.grey,
      onTap: (page) => Get.to(MainScreen(page)),//todo Navigator.of(context).pop(page),
      items: List.generate(
        tabs.length,
            (index) => BottomNavigationBarItem(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          icon: ImageIcon(AssetImage(tabs[index]['icon'])),
          label: tabs[index]['title'],
        ),
      ),
    );
  }
}


Widget myIndicator(BuildContext context) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        new CircularProgressIndicator(
          color: Colors.blue,
        ),
        Gap(14),
        new Text(
          "Loading....",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 14),
        ),
      ],
    ),
  );
}
