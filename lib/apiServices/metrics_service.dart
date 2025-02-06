import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/extensions/object_extension.dart';


class MetricsServices {
  MetricsServices._();
  static final MetricsServices metricsServices = MetricsServices._();

  var pref = GetStorage();
  Dio dio = Dio();

  Future<Map> getMetrics() async {
    try {
      FormData data = FormData.fromMap({
        'uid': pref.read("user_id") ?? "52",
        'coach_id': pref.read("coach_id"),
      });

      var response = await dio.post("$baseUrl/matric.php", data: data);
      if (response.statusCode == 200) {
        myLog("Response data: ${response.data["data"]}");
        return response.data;
      } else {
        myLog("Error in Metrics Service class: ${response.statusCode}");
        return {};
      }
    } catch (e) {
      myLog("Error: ${e.toString()}");
      return {};
    }
  }
}
