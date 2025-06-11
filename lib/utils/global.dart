import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../Screens/HomeScreen.dart';
import '../Screens/MainScreen.dart';
import '../Screens/PaymentScreen.dart';
import '../Screens/ProfileScreen.dart';
import '../Screens/ToolsScreen.dart';
import '../main.dart';

List pages = [
  const HomeScreen(),
  const ToolsScreen(),
  const PaymentScreen(),
  ProfileScreen(),
];

String publishKey = "pk_test_SXBwRRvbVwgxBhVLmCIswB3Y00ThG9QkYX";
String secretKey = "sk_test_8Bj4c8qCQz9U90pAR25E7v6k00JuAnfax5";

Container backgroundImage(BuildContext context) {
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

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //todo --------------------> logo image
        Image.asset(
          "assets/images/logo.png",
          width: size.width / 2.5,
          height: 60,
          fit: BoxFit.fill,
        ),
        //todo --------------------> all last images
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed("/trainingScreen");
              },
              child: Image.asset(
                "assets/images/tool.png",
                height: 30,
                fit: BoxFit.fill,
              ),
            ),
            const Gap(9),
            InkWell(
              onTap: () {
                Get.toNamed('/nutrition-screen');
              },
              child: Image.asset(
                darkMode.value
                    ? "assets/images/plans_darkmode.png"
                    : "assets/images/plans.png",
                //"assets/images/trools.png",
                height: 26,
                fit: BoxFit.fill,
              ),
            ),
            const Gap(6),
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
      ],
    );
  }
}

Future<int> getAndroidVersion() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    int androidVersion = int.parse(androidInfo.version.release.toString());
    log(androidVersion.toString());
    return androidVersion;
  } else {
    return 0;
  }
}

class MyBottomNavBar extends StatelessWidget {
  final List tabs;
  final dynamic index;
  const MyBottomNavBar({super.key, required this.tabs, this.index});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index ?? 0,
      elevation: 0,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      showUnselectedLabels: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      iconSize: 30,
      selectedItemColor: Theme.of(context).primaryColorLight,
      unselectedItemColor: Colors.grey,
      onTap: (page) =>
          Get.to(MainScreen(page)), //todo Navigator.of(context).pop(page),
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
        const CircularProgressIndicator(
          color: Colors.blue,
          strokeCap: StrokeCap.round,
        ),
        const Gap(14),
        Text(
          "Loading...",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
        ),
      ],
    ),
  );
}

// BottomNavigationBar myBottomNavBar(BuildContext context, List tabs) {
//   return BottomNavigationBar(
//     elevation: 0,
//     selectedFontSize: 12,
//     unselectedFontSize: 10,
//     showUnselectedLabels: true,
//     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//     iconSize: 30,
//     selectedItemColor: Theme.of(context).primaryColorLight,
//     unselectedItemColor: Colors.grey,
//     onTap: (page) => Get.to(MainScreen(page)),//todo Navigator.of(context).pop(page),
//     items: List.generate(
//       tabs.length,
//           (index) => BottomNavigationBarItem(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         icon: ImageIcon(AssetImage(tabs[index]['icon'])),
//         label: tabs[index]['title'],
//       ),
//     ),
//   );
// }
