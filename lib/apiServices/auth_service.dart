import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as formData;

import '../Utils/url.dart';
import '../snackbar.dart';

class AuthService {
  static var client = http.Client();
  String? deviceType;
  var pref = GetStorage();

  Future<bool> registerApi(BuildContext context,
      {String? name, email, password, usertype, phoneno, fcmtoken}) async {
    // final FirebaseMessaging fcm = FirebaseMessaging.instance;
    // final fcmToken = await fcm.getToken();
    // debugPrint(fcmToken);
    Dio dio = Dio();
    formData.FormData form;

    form = formData.FormData.fromMap({
      // 'token': token,
      'fcm_token': fcmtoken,
      'phone': phoneno,
      'name': name,
      'email': email,
      'password': password,
      'user_type': usertype
    });

    var response = await dio.post(
      '$baseUrl/signup.php',
      data: form,
    );

    print("ddddddddddddddddddd$response");
    print(form.fields);
    if (response.statusCode == 200) {
      var data = response.data;
      debugPrint(data['status']);
      if (data['status'] == 'true') {
        Get.back();
        Get.snackbar('Success', data['data'],
            duration: Duration(seconds: 20),
            backgroundColor: Colors.green,
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            maxWidth: MediaQuery.of(context).size.width * 0.8);

        return true;
      }
      snackbar(context: context, msg: data['data'], title: 'Failed');

      return false;
    } else {
      snackbar(context: context, msg: 'Register Failed', title: 'Failed');

      return false;
    }
  }

  Future<bool> loginApi(BuildContext context,
      {String? email, password, fcomtoken}) async {
    // final FirebaseMessaging fcm = FirebaseMessaging.instance;
    // final fcmToken = await fcm.getToken();
    // debugPrint(fcmToken);
    Dio dio = Dio();
    formData.FormData form;

    form = formData.FormData.fromMap({
      // 'token': token,
      'fcm_token': fcomtoken != '' ? fcomtoken : 'u8iihbufbsbfsfKNL',
      'email': email,
      'password': password,
    });

    var response = await dio.post(
      '$baseUrl/login.php',
      data: form,
    );

    print("login details-------------$response");
    print(form.fields);
    if (response.statusCode == 200) {
      var data = response.data;
      debugPrint(data['status']);
      if (data['status'] == 'true') {
        pref.write('isLogin', true);
        pref.write('user_id', data['data']['id']);
        pref.write('role', data['data']['role']);
        // pref.write('token', data['data']['token']);

        return true;
      }
      snackbar(context: context, msg: data['data'], title: 'Success');

      return false;
    } else {
      snackbar(context: context, msg: 'Something Went SWrong', title: 'Failed');

      return false;
    }
  }

  Future<bool> forgotpassApi(BuildContext context, {String? email}) async {
    Dio dio = Dio();
    formData.FormData form;

    form = formData.FormData.fromMap({
      'email': email,
    });

    var response = await dio.post(
      '$baseUrl/forgot-password.php',
      data: form,
    );

    print("ddddddddddddddddddd$response");
    print(form.fields);
    if (response.statusCode == 200) {
      var data = response.data;
      debugPrint(data['status']);
      if (data['status'] == 'true') {
        Get.back();
        snackbar(context: context, msg: data['data'], title: 'Success');

        return true;
      }
      snackbar(context: context, msg: data['data'], title: 'Failed');

      return false;
    } else {
      snackbar(context: context, msg: 'Something Went SWrong', title: 'Failed');

      return false;
    }
  }
}
