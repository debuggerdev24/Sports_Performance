import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apiServices/profile_service.dart';

class SettingController extends GetxController {
  final current = TextEditingController();
  final confirmpas = TextEditingController();
  final newpass = TextEditingController();
  late SharedPreferences sharedPreferences;
  RxString languageCode = "en".obs;
  var isLoading = false.obs;
  changepass(BuildContext context) async {
    isLoading(true);
    bool check = await ProfileTabService()
        .changePass(context, current: current.text, newpas: newpass.text);
    isLoading(false);
  }

  Future<void> changeLanguage(String languageCode) async {
    this.languageCode.value = languageCode;
    Get.updateLocale(Locale(languageCode));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("selectedLanguage", languageCode);
  }

  Future<void> getLanguageCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    languageCode.value = prefs.getString('selectedLanguage') ?? "en";
    Get.updateLocale(Locale(languageCode.value));
  }

  SettingController(){
    getLanguageCode();
  }
}
