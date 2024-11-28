import 'package:get/get.dart';

import '../../apiServices/home_service.dart';
import '../../models/banner_model.dart';
import '../main_screen_controller.dart';

class HomeScreenController extends GetxController {
  var isLoading = false.obs;
  var i = 0.obs;

  @override
  void onInit() async {
    isLoading(true);
    await getbanner();
    await getGoal();
    isLoading(false);
    super.onInit();
  }

  final mainscreenController = Get.find<MainScreenController>();
  var bannerList = List<BannerListModel>.empty(growable: true).obs;
  var goals = List<String>.empty(growable: true).obs;

  getbanner() async {
    bannerList.assignAll(await HomeScreenService().bannerList());
  }

  getGoal() async {
    goals.assignAll(await HomeScreenService().goalsApi());
    // print('goals' + goals[0]);
  }

  
}
