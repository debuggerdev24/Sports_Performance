import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apiServices/profile_service.dart';
import '../main_screen_controller.dart';

class EditProfileController extends GetxController {
  var isLoading = false.obs;
  var ispictureLoading = false.obs;
  var istimelinepictureLoading = false.obs;
  final mainscreenController = Get.find<MainScreenController>();

  final name = TextEditingController();
  final email = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();
  var gender = "Male".obs;
  final phoneNo = TextEditingController();
  getdetail() {
    name.text = mainscreenController.userdetailList[0].name;
    phoneNo.text = mainscreenController.userdetailList[0].phone;
    email.text = mainscreenController.userdetailList[0].email;
    gender.value = mainscreenController.userdetailList[0].gender != ''
        ? mainscreenController.userdetailList[0].gender
        : 'Male';
    weight.text = mainscreenController.userdetailList[0].weight != ''
        ? mainscreenController.userdetailList[0].weight
        : '';
    height.text = mainscreenController.userdetailList[0].height;
  }

  // Future<void> selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime(2100));
  //   if (picked != null)
  //     dob.text =
  //         "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    getdetail();
    super.onInit();
  }

  uploadProfileImage(String? imgpath, BuildContext context) async {
    ispictureLoading(true);
    // print(imgpath);
    bool check =
        await ProfileTabService().profilePictureApi(context, image: imgpath);
    if (check) {
      await mainscreenController.getuserdetails(context);
      ispictureLoading(false);
    }
    // isLoading(false);
  }

  editProfile(BuildContext context) async {
    isLoading(true);
    bool check = await ProfileTabService().profileUpdate(context,
        weight: weight.text,
        gender: gender.value,
        name: name.text,
        email: email.text,
        phone: phoneNo.text,
        height: height.text);

    if (check) {
      mainscreenController.getuserdetails(context);
    }
    isLoading(false);
  }
}
