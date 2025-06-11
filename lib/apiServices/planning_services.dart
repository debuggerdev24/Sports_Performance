import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sportperformance/Models/PlannigModel.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import 'package:sportperformance/models/program_model.dart';

class PlanningProgrammingServices {
  var pref = GetStorage();
  Dio dio = Dio();

  Future<PlanningModel?> getPlans() async {
    try {
      FormData data = FormData.fromMap({
        'uid': pref.read("user_id"),
        'coach_id': pref.read("coach_id"),
      });

      Map dta = {
        'uid': pref.read("user_id"),
        'coach_id': pref.read("coach_id"),
      };

      myLog(dta.toString());
      var response = await dio.post("$baseUrl/my-planning.php",
          data: data); //https://sportsperformance.cl/api/my-planning.php
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

  Future<ProgramModel?> getProgram() async {
    // try {
    FormData data = FormData.fromMap({
      'uid': pref.read("user_id"),
      'coach_id': pref.read("coach_id"),
    });
    Map dta = {
      'uid': pref.read("user_id"),
      'coach_id': pref.read("coach_id"),
    };

    myLog(dta.toString());

    var response = await dio.post(
      "$baseUrl/client-program.php",
      data: data,
    ); //https://sportsperformance.cl/api/my-planning.php
    myLog("Response data -----------------> ${response.data["data"]}");
    if (response.data['code'].toString() == "6") {
      return ProgramModel.fromJson(response.data['data']);
    }
    return null;
    // } catch (e) {
    //   myLog(e.toString());
    //   return null;
    // }
  }
}
