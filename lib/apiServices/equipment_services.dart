import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sportperformance/Utils/url.dart';

class EquipmentServices {
  var pref = GetStorage();
  Dio dio = Dio();

  Future<String?> getEquipment() async {
    try {
      FormData data = FormData.fromMap({
        'uid': pref.read("user_id"),
        'coach_id': pref.read("coach_id"),
      });
      var response = await dio.post("$baseUrl/my-equipment.php", data: data);
      print(response.data);
      if (response.data['code'].toString() == "6") {
        return response.data['data']['equipment'];
      }
      return "";
    } catch (e) {
      print(e);
      return null;
    }
  }
}
