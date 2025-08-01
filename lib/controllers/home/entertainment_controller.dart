import 'package:get/get.dart';

import '../../apiServices/home_service.dart';
import '../../models/my_calenderdata_model.dart';
import '../main_screen_controller.dart';

class EntertainmentController extends GetxController {
  var isLoading = false.obs;
  var i = 0.obs;
  var selectedDate = "".obs;
  final mainScreenController = Get.find<MainScreenController>();
  var workOutList = List<MyCalenderData>.empty(growable: true).obs;
  var exerciseStatus = Rxn<List<String>>();
  Rxn<bool> isWorkoutCompleted = Rxn<bool>();

  // var goals = List<String>.empty(growable: true).obs;
  getCalenderData(String date) async {
    workOutList.value = [];
    isWorkoutCompleted.value = false;
    isLoading(true);
    workOutList.value = await HomeScreenService().myCalenderExercise(date);
    if (workOutList.isNotEmpty) {
      isWorkoutCompleted.value = workOutList[0].burn == "1";
    }
    isLoading(false);
  }

  markComplete(String id) async {
    bool check = await HomeScreenService().markWorkoutComplete(id);
    if (check) {
      Get.back();
      await getCalenderData(selectedDate.value);
    }
  }

  getExerciseStatus({required String year, required String month}) async {
    exerciseStatus.value = null;
    exerciseStatus.value =
        await HomeScreenService().getExerciseStatus(year: year, month: month);
  }

  @override
  void onInit() async {
    isLoading(true);
    // TODO: implement onInit
    selectedDate.value =
        "${DateTime.now().year}-${(DateTime.now().month).toString().padLeft(2, '0')}-${DateTime.now().day}";
    await getCalenderData(selectedDate.value);
    isLoading(false);
    super.onInit();
  }
}
