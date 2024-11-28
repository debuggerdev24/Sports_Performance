import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../apiServices/auth_service.dart';
import '../../apiServices/profile_service.dart';
import '../../notificationService.dart';

class SettingController extends GetxController {
  final current = TextEditingController();
  final confirmpas = TextEditingController();
  final newpass = TextEditingController();
  var isLoading = false.obs;
  changepass(BuildContext context) async {
    isLoading(true);
    bool check = await ProfileTabService()
        .changePass(context, current: current.text, newpas: newpass.text);
    // check ? Get.back() : null;
    isLoading(false);
  }
}
