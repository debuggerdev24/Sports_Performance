import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../notificationService.dart';

class SplashController extends GetxController {
  BuildContext? context;
  SplashController({this.context});
  final pref = GetStorage();
  Future onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    showDialog(
      context: context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title ?? ''),
        content: Text(body ?? ''),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {},
          )
        ],
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      FirebaseNotification().setUpFirebase(onDidReceiveLocalNotification);
      bool isLogin = pref.read('isLogin') ?? false;
      if (isLogin) {
        // pref.read('role') == '1'
        //     ? Get.offNamed('/user-home', arguments: [context])
        //     : Get.offNamed('/trainer-home', arguments: [context]);
        Get.offNamed('/main-screen', arguments: [context]);
      } else {
        pref.read('onboarding') ?? false
            ? Get.offAndToNamed('/login', arguments: [context])
            : Get.offAndToNamed('/gettingstart');
      }
    });
  }
}
