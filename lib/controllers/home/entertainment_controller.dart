import 'dart:developer';

import 'package:get/get.dart';

import '../../apiServices/home_service.dart';
import '../../models/banner_model.dart';
import '../../models/my_calenderdata_model.dart';
import '../main_screen_controller.dart';

class EntertainmentController extends GetxController {
  var isLoading = false.obs;
  var i = 0.obs;
  var selectedDate = ''.obs;
  final mainscreenController = Get.find<MainScreenController>();
  var calenderList = List<MyCalenderData>.empty(growable: true).obs;
  // var goals = List<String>.empty(growable: true).obs;
  getCalenderData(String date) async {
    calenderList.assignAll(await HomeScreenService().myCalenderExercise(date));
  }

  markComplete(String id) async {
    bool check = await HomeScreenService().markWorkoutComplete(id);
    if (check) {
      Get.back();
      await getCalenderData(selectedDate.value);
    }
  }

  @override
  void onInit() async {
    isLoading(true);
    // TODO: implement onInit
    selectedDate.value =
        "${DateTime.now().year}-${(DateTime.now().month).toString().padLeft(2, '0')}-${DateTime.now().day}";
    log(isLoading.toString());
    await getCalenderData(selectedDate.value);

    isLoading(false);
    super.onInit();
  }
}
