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
        totalNutirient.value = double.parse(value.carbs ?? "") * 4 +
            double.parse(value.fat ?? "") * 9 +
            double.parse(value.protein ?? "") * 4;
            // double.parse(value.fiber ?? "200");
        isLoading.value = false;
      } else {
        isLoading.value = false;
        showError.value = true;
      }
    });
  }

  @override
  void onInit() {
    final weekday = DateFormat('EEEE').format(DateTime.now()).toLowerCase();
    getNutritions(weekday);
    super.onInit();
  }
}