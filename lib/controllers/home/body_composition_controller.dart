import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sportperformance/Models/body_composition_chart_model.dart';
import 'package:sportperformance/Models/body_composition_model.dart';
import 'package:sportperformance/Models/timeLine_linegraph_model.dart';
import 'package:sportperformance/apiServices/main_service.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import '../main_screen_controller.dart';

class BodyCompositionController extends GetxController {
  var isLoading = false.obs;
  final mainscreenController = Get.find<MainScreenController>();
  var bodyComposition = List<BodyCompositionModel>.empty(growable: true).obs;
  var piechart = List<BodyCompositionPieChartModel>.empty(growable: true).obs;
  var linegraph = List<LineGraphData>.empty(growable: true).obs;//todo -> for Timeline section
  var dataMap = Rxn<Map<String, double>>();
  getData() async {
    bodyComposition.assignAll(await MainScreenService().bodyCompositionApi());
    piechart.assignAll(await MainScreenService().pieChartApi());
    linegraph.assignAll(await MainScreenService().timelineGraphApi());
    if (piechart.isNotEmpty) {
      dataMap.value = {
        'Masa Adiposa': double.parse(piechart[0].adiposaPercentage),
        'Masa Muscular': double.parse(piechart[0].muscularPercentage),
        'Masa Residual': double.parse(piechart[0].residualPercentage),
        'Masa Osea': double.parse(piechart[0].oseaPercentage),
        'Masa de la Piel': double.parse(piechart[0].dialPielPercentage),
      };
    }
  }

  @override
  void onInit() async {
    isLoading(true);
    await getData();
    isLoading(false);
    super.onInit();
  }
}
