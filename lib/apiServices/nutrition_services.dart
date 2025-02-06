import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sportperformance/Models/NutritionModel.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/extensions/object_extension.dart';

import '../snackbar.dart';

class NutritionServices {
  var pref = GetStorage();
  Dio dio = Dio();

  Future<NutritionModel?> getNutritionList(String day) async {
    try {
      FormData data = FormData.fromMap({
        'uid': pref.read("user_id"),
        'coach_id': pref.read("coach_id"),
      });
      // log("Fields ---------------> $data");
      // log("Fields ---------------> ${data.fields}");
      // log("Data ---------------> ${data.files}");
      // log("url ---> ${mainUrl}/my-nutrition.php");
      var response =
          await dio.post("$mainUrl/api/my-nutrition.php", data: data);
      log("body ---------------> ${response.data}");
      if (response.data['code'].toString() == "6") {
        for (var element in (response.data['data'] as List)) {
          if (element['day_name'] == day) {
            return NutritionModel.fromJson(element);
          }
        }
      }
      return null;
    } catch (e) {
      myLog(e.toString());
      return null;
    }
  }

  Future<String> downloadFile(String fileUrl, String fileName, BuildContext context) async {
    try {
      String filePath;
      if (Platform.isAndroid) {
        filePath = (Platform.isAndroid)
            ? "/storage/emulated/0/Download/$fileName"
            : "";
      } else {
        Directory dir = await getApplicationDocumentsDirectory();
        filePath = "${dir.path}/$fileName";
      }

      Response response = await dio.download(fileUrl, filePath);

      if (response.statusCode == 200) {
        customSnackBar(
          context: context,
          msg: "File saved successfully to downloads",
          title: 'Success',
          color: Colors.green,
        );
      }
      return filePath;
    } catch (e) {
      myLog("---------------------- Error in PDF Downloading ------> ${e.toString()}");
      return "Error";
    }
  }
}