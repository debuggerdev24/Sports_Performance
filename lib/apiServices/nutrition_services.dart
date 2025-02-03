import 'dart:developer';
import 'package:sportperformance/utils/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sportperformance/Models/NutritionModel.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import 'package:sportperformance/snackbar.dart';

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
      print(e);
      return null;
    }
  }

  Future<String> downloadFile(String fileUrl, String fileName, BuildContext context) async {
    try {
    final directory = await getApplicationDocumentsDirectory();
    // var filePath = '/storage/emulated/0/Download/$fileName';
    String filePath = "${directory!.path}/$fileName";
    myLog("$mainUrl$nutritionDocUrl$fileName");
    Response response = await dio.download(fileUrl, filePath);
    if (response.statusCode == 200) {
      print("\nPDF successfully downloaded to: $filePath");
      // Optionally, you can show a success message in your app
    } else {
      print("Download failed with status code: ${response.statusCode}");
    }

    return filePath;


    } catch (e) {
      print("__----------____------> Error in PDF Downloading ------> ${e.toString()}");
      snackbar(
        context: context,
        msg: "Download Failed Please Try Again",
        title: 'Failed',
      );
      return "Error";
    }
  }
}
