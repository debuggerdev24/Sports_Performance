import 'package:get/get.dart';
import 'package:sportperformance/Models/PlannigModel.dart';
import 'package:sportperformance/apiServices/planning_services.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import 'package:sportperformance/models/program_model.dart';

class PlanningProgrammingController extends GetxController {
  RxBool isLoading = true.obs, isProgramsLoading = true.obs;
  RxBool showError = false.obs;
  late PlanningModel plan;
  late ProgramModel program;

  getPlanning() {
    isLoading(true);
    PlanningProgrammingServices().getPlans().then((value) {
      if (value != null) {
        plan = value;
        // myLog("Plan Data ---------------------> ${plan.id.toString()}");
        isLoading(false);
      } else {
        isLoading(false);
        showError(true);
      }
    });
  }

  getProgram() {
    isProgramsLoading(true);
    PlanningProgrammingServices().getProgram().then((value) {
      if (value != null) {
        program = value;
        myLog("-------------------------------> ${program.toString()}");
        // myLog("Plan Data ---------------------> ${plan.id.toString()}");
        isProgramsLoading(false);
      } else {
        isProgramsLoading(false);
        showError(true);
      }
    });
  }

  @override
  void onReady() {
    getPlanning();
    super.onReady();
  }
}
