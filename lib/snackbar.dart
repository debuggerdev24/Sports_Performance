import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnackBar(
    {required String? msg,
    required String? title,
    required Color? color,
    required BuildContext? context,
    SnackPosition snackPosition = SnackPosition.BOTTOM}) {
  Get.snackbar(title ?? '', msg ?? '',
      duration: const Duration(seconds: 3),
      backgroundColor: color,
      snackStyle: SnackStyle.FLOATING,
      colorText: Colors.white,
      snackPosition: snackPosition,
      isDismissible: true,
      margin: const EdgeInsets.only(bottom: 50, top: 30),
      maxWidth: MediaQuery.of(context!).size.width * 0.8);
}
