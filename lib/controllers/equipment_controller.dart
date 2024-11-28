import 'package:get/get.dart';
import 'package:sportperformance/apiServices/equipment_services.dart';

class EquipmentController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool showError = false.obs;
  late String equipment;

  getEquipment() {
    isLoading(true);
    EquipmentServices().getEquipment().then((value) {
      if (value != null) {
        equipment = value;
        isLoading(false);
      } else {
        isLoading(false);
        showError(true);
      }
    });
  }

  @override
  void onReady() {
    getEquipment();
    super.onReady();
  }
}
