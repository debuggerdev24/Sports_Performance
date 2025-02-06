import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dio/src/multipart_file.dart' as multipart_file;
import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as formData;

import 'package:http_parser/src/media_type.dart' as mediaType;
import 'package:http_parser/src/media_type.dart' show MediaType;

import '../Utils/url.dart';
import '../snackbar.dart';

class ProfileTabService {
  static var client = http.Client();
  String? deviceType;
  var pref = GetStorage();

  Future<bool> profileUpdate(BuildContext context,
      {String? name, phone, gender, email, weight, height}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'name': name,
      'phone': phone,
      'gender': gender,
      'email': email,
      'weight': weight,
      'height': height,
    });

    var response = await dio.post(
      '$baseUrl/profile-update.php',
      data: form,
      options: Options(headers: headers),
    );
    // print(headers);
    // print('form================== $form');
    // print("ddddddddddddddddddd${pref.read('user_id')}");
    // print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Get.back();
        customSnackBar(context: context, msg: data['data'], title: 'Success',color: Colors.green);
        return true;
      } else {
        customSnackBar(context: context, msg: data['data'], title: 'Failed',color: Colors.red);

        return false;
      }
    }
    return false;
  }

  Future<bool> changePass(BuildContext context,
      {String? current, newpas}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'current_password': current,
      'new_password': newpas,
    });

    var response = await dio.post(
      '$baseUrl/change-password.php',
      data: form,
      options: Options(headers: headers),
    );
    print(headers);

    print(form.fields);
    var data = response.data;
    debugPrint(data['status']);
    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        Get.back();
        customSnackBar(context: context, msg: data['data'], title: 'Success',color: Colors.green);

        return true;
      } else {
        customSnackBar(context: context, msg: data['data'], title: 'Failed',color: Colors.red);

        return false;
      }
    }
    return false;
  }

  Future<bool> profilePictureApi(BuildContext context, {String? image}) async {
    Dio dio = Dio();
    formData.FormData form;
    var headers = {
      'Authorization': pref.read('token'),
    };
    form = formData.FormData.fromMap({
      'uid': pref.read('user_id'),
      'old_profile_picture': '',
      "image":
          await multipart_file.MultipartFile.fromFile(image!, filename: image),
    });

    var response = await dio.post(
      '$baseUrl/profile-picture-update.php',
      data: form,
      options: Options(headers: headers),
    );
    // print(headers);
    // print('form================== ${form.fields}');
    // print("ddddddddddddddddddd${pref.read('user_id')}");
    // print(form.fields);
    var data = response.data;

    if (response.statusCode == 200) {
      if (data['status'] == 'true') {
        // Get.back();

        // customSnackBar(context: context, msg: data['data'], title: 'Success');

        return true;
      } else {
        customSnackBar(context: context, msg: data['data'], title: 'Failed',color: Colors.red);

        return false;
      }
    }
    return false;
  }
}
