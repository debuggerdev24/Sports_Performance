import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sportperformance/models/user_model.dart';

import '../apiServices/main_service.dart';

class MainScreenController extends GetxController {
  BuildContext context;
  MainScreenController(this.context);
  var isLoading = false.obs;
  var userdetailList = List<UserDetailModel>.empty(growable: true).obs;
  // var homeCategoryList = List<HomeCategory>.empty(growable: true).obs;

  getuserdetails(BuildContext context) async {
    isLoading(true);
    userdetailList.clear();
    userdetailList.value = await MainScreenService().userdetail(context);
    print("coach id------------------${userdetailList[0].coachId}");
    isLoading(false);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    getuserdetails(context);
    super.onReady();
  }
}
