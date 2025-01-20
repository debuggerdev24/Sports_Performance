import 'package:get/get.dart';
import 'package:sportperformance/apiServices/metrics_service.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import '../models/metrics_model.dart';

class MetricsController extends GetxController {
  Rx<MetricsModel?> metricsModel = Rx<MetricsModel?>(null);

  Future<void> getMetrics() async {
    try{
      Map data = await MetricsServices.metricsServices.getMetrics();
      metricsModel.value = MetricsModel.fromJson(data);
    }
    catch(e){
      myLog(e.toString());
    }
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    await getMetrics();
    super.onInit();
  }
}
