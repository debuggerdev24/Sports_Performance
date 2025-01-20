import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sportperformance/Models/PlannigModel.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/extensions/object_extension.dart';

class PlanningServices {
  var pref = GetStorage();
  Dio dio = Dio();

  Future<PlanningModel?> getPlanning() async {
    try {
      FormData data = FormData.fromMap({
        'uid': pref.read("user_id"),
        'coach_id': pref.read("coach_id"),
      });
      var response = await dio.post("$baseUrl/my-planning.php", data: data);//https://sportsperformance.cl/api/my-planning.php
      myLog("Response data -----------------> ${response.data["data"]}");
      if (response.data['code'].toString() == "6") {
        return PlanningModel.fromJson(response.data['data']);
      }
      return PlanningModel();
    } catch (e) {
      myLog(e.toString());
      return null;
    }
  }
}
