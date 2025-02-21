import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';


import 'package:get/get.dart';
import 'package:sportperformance/Components/MyNotification.dart';
import 'package:sportperformance/Screens/noDataFound.dart';
import 'package:sportperformance/Screens/shimmer/notification_shimmer.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/utils/global.dart';

import '../controllers/home/notification_controller.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = "NotificationScreen";
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  ////final translator = TranslatorGenerator.instance;



  final notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: SafeArea(
              child: Column(
                children: [
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
                        context.translator.notificationTitle,
                        // translator.getString("Notification.title"),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: size.width * 0.05,
                            ),
                      ),
                      Gap(30),
                    ],
                  ),
                  Gap(20),
                  Obx(() {
                    return Expanded(
                      child: Transform(
                        transform: Matrix4.translationValues(0, -25, 0),
                        child: notificationController.isLoading.value
                            ? NotificationShimmer()
                            : notificationController.notificationList.isEmpty
                                ? NoDataFound(
                                    buttnText: context.translator.noNotification,
                                    img: 'assets/images/empty_notification.png',
                                    // 'https://cdn-icons-png.flaticon.com/512/3541/3541850.png',
                                    title: context.translator.noNotificationsRightNow,
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
                                            .notificationList[i]
                                            .notiDescription,
                                      ),
                                    ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
