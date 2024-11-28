import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sportperformance/Models/NutritionModel.dart';
import 'package:sportperformance/Utils/url.dart';
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
      var response = await dio.post("$mainUrl/my-nutrition.php", data: data);
      print("------------------> Nutrition ${response.data}");
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

  Future<String> downloadFile(String fileName, BuildContext context) async {
    try {
      var filePath = '/storage/emulated/0/Download/$fileName';
      await dio.download("$mainUrl$nutritionDocUrl$fileName", filePath);
      return filePath;
    } catch (e) {
      print(e);
      snackbar(
        context: context,
        msg: "Download Failed Please Try Again Later",
        title: 'Failed',
      );
      return "Error";
    }
  }
}
