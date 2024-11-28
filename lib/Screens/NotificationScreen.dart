import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/MyNotification.dart';
import 'package:sportperformance/Screens/noDataFound.dart';
import 'package:sportperformance/Screens/shimmer/notification_shimmer.dart';
import 'package:sportperformance/main.dart';

import '../controllers/home/notification_controller.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = "NotificationScreen";
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final translator = TranslatorGenerator.instance;
  final notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    Text(
                      translator.getString("Notification.title"),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return Expanded(
                    child: Transform(
                      transform: Matrix4.translationValues(0, -25, 0),
                      child: notificationController.isLoading.value
                          ? NotificationShimmer()
                          : notificationController.notificationList.isEmpty
                              ? NoDataFound(
                                  buttnText: 'No Notification',
                                  img: 'assets/images/empty_notification.png',
                                  // 'https://cdn-icons-png.flaticon.com/512/3541/3541850.png',
                                  title: 'No Notifications Right Now',
                                )
                              : ListView.builder(
                                  itemCount: notificationController
                                      .notificationList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (ctx, i) => MyNotification(
                                    time: notificationController
                                        .convertDateFormat(
                                            notificationController
                                                .notificationList[i]
                                                .createdDate),
                                    title: notificationController
                                        .notificationList[i].notiTitle,
                                    subtitle: notificationController
                                        .notificationList[i].notiDescription,
                                  ),
                                ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
