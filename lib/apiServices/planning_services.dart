import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sportperformance/Models/PlannigModel.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import 'package:sportperformance/models/program_model.dart';

class PlanningProgrammingServices {
  // static final PlanningProgrammingServices _instance =
  //     PlanningProgrammingServices._internal();
  //
  // factory PlanningProgrammingServices() => _instance;

  PlanningProgrammingServices() {
    initDio();
  }

  final pref = GetStorage();
  late Dio _dio;

  void initDio() {
    _dio = Dio();
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
      ),
    );
  }

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

      var response = await _dio.post("$baseUrl/my-planning.php",
          data: data); //https://sportsperformance.cl/api/my-planning.php
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
    // Map dta = {
    //   'uid': pref.read("user_id"),
    //   'coach_id': pref.read("coach_id"),
    // };
    //
    // myLog(dta.toString());

    var response = await _dio.post(
      "$baseUrl/client-program.php",
      data: data,
    ); //https://sportsperformance.cl/api/my-planning.php
    if (response.data['code'].toString() == "6") {
      return ProgramModel.fromJson(response.data['data']);
    }
    return null;
    // } catch (e) {
    //   myLog(e.toString());
    //   return null;
    // }
  }

  Future<void> programSeenByCustomer() async {
    try {
      FormData data = FormData.fromMap({
        'uid': pref.read("user_id"),
        'coach_id': pref.read("coach_id"),
      });

      var response = await _dio.post(
        "$baseUrl/program-seen-by-customer.php",
        data: data,
      );
      // myLog(
      //     "Response data (Seen BY Customer)-----------------> ${response.data["data"]}");
      if (response.data['code'].toString() == "6") {
        myLog("Seen By Customer Called Successfully");
      }
    } catch (e) {
      myLog(e.toString());
    }
  }
}
