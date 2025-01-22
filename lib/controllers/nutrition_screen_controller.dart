import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sportperformance/Models/NutritionModel.dart';
import 'package:sportperformance/apiServices/nutrition_services.dart';

class NutritionScreenController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool showError = false.obs;
  NutritionModel? nutritions;
  RxDouble totalNutirient = 0.0.obs;

  getNutritions(String day) {

    isLoading(true);
    NutritionServices().getNutritionList(day).then((value) {
      if (value != null) {
        nutritions = value;
        totalNutirient.value = double.parse(value.carbs ?? "") +
            double.parse(value.fat ?? "") +
            double.parse(value.protein ?? "") +
            double.parse(value.fiber ?? "");
        isLoading.value = false;
      } else {
        isLoading.value = false;
        showError.value = true;
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
