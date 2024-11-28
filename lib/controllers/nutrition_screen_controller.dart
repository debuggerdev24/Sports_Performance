import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sportperformance/Models/NutritionModel.dart';
import 'package:sportperformance/apiServices/nutrition_services.dart';

class NutritionScreenController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool showError = false.obs;
  NutritionModel? nutritions;
  late double totalNutirient;

  getNutritions(String day) {
    isLoading(true);
    NutritionServices().getNutritionList(day).then((value) {
      if (value != null) {
        nutritions = value;
        totalNutirient = double.parse(value.carbs ?? "") +
            double.parse(value.fat ?? "") +
            double.parse(value.protein ?? "") +
            double.parse(value.fiber ?? "");
        isLoading(false);
      } else {
        isLoading(false);
        showError(true);
      }
    });
  }

  @override
  void onReady() {
    final weekday = DateFormat('EEEE').format(DateTime.now()).toLowerCase();
    getNutritions(weekday);
    super.onReady();
  }
}
