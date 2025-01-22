import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackbar(
    {String? msg,
    String? title,
    BuildContext? context,
    SnackPosition snackPosition = SnackPosition.BOTTOM}) {
  Get.snackbar(title ?? '', msg ?? '',
      duration: Duration(seconds: 3),
      backgroundColor: title == 'Success' ? Colors.green : Colors.red,
      snackStyle: SnackStyle.FLOATING,
      colorText: Colors.white,
      snackPosition: snackPosition,
      isDismissible: true,
      margin: EdgeInsets.only(bottom: 50, top: 30),
      maxWidth: MediaQuery.of(context!).size.width * 0.8);
}
