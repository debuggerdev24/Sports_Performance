import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sportperformance/Models/NutritionModel.dart';
import 'package:sportperformance/apiServices/nutrition_services.dart';

class NutritionScreenController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool showError = false.obs;
  List<NutritionModel> nutritions = [];
  RxList<double> totalNutritionts = <double>[].obs;

  getNutritions(String day) {
    isLoading(true);
    NutritionServices().getNutritionList(day).then((value) {
      if (value != null) {
        nutritions = value;
        totalNutritionts.value = nutritions!.map(
          (e) {
            return (double.parse(e.carbs ?? "") * 4 +
                double.parse(e.fat ?? "") * 9 +
                double.parse(e.protein ?? "") * 4);
          },
        ).toList();
        // double.parse(value.fiber ?? "200");
        isLoading.value = false;
      } else if (value == null) {
        isLoading.value = false;
      }
    });
  }

  // @override
  // void onInit() {
  //   final weekday = DateFormat('EEEE').format(DateTime.now()).toLowerCase();
  //   getNutritions(weekday);
  //   super.onInit();
  // }
}
