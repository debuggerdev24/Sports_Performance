import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Components/InputFeild.dart';
import 'package:sportperformance/Components/MyButtton.dart';
import 'package:sportperformance/Components/MyDropdown.dart';
import 'package:sportperformance/Components/SelectionType.dart';
import 'package:sportperformance/utils/global.dart';

import '../controllers/main_screen_controller.dart';
import '../controllers/profile/editProfile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = "EditProfileScreen";

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ////final translator = TranslatorGenerator.instance;

  final editprofileController = Get.put(EditProfileController());
  final mainscreenController = Get.find<MainScreenController>();

  final _formKey = GlobalKey<FormState>();
  File? image;

  // final pref = GetStorage();

  Future<void> getGalleryImage() async {
    dynamic imageData = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      // imageQuality: 40,
    );
    setState(() {
      image = File(imageData.path);
    });
  }

  Future<void> getCameraImage() async {
    dynamic imageData = await ImagePicker().pickImage(
      source: ImageSource.camera,
      // imageQuality: 40,
    );
    setState(() {
      image = File(imageData.path);
    });
  }

  // getCamImage() async {
  //   dynamic imageData =
  //       await ImagePicker().pickImage(source: ImageSource.camera);
  //   setState(() {
  //     image = File(imageData.path);
  //   });
  // }

  void openOptions(BuildContext context, Size size) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 18, left: 18),
                child: Text(
                  "Profile Photo",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Gap(size.height * 0.025),
            ListTile(
              onTap: () async {
                await getCameraImage();
                if (image != null) {
                  editprofileController.uploadProfileImage(
                      image!.path, context);
                  Navigator.pop(context);
                }
              },
              leading: Icon(Icons.photo_camera),
              title: const Text("Camera"),
            ),
            ListTile(
              enableFeedback: true,
              autofocus: true,
              onTap: () async {
                await getGalleryImage();
                if (image != null) {
                  if (image != null) {
                    editprofileController.uploadProfileImage(
                        image!.path, context);
                    Navigator.pop(context);
                  }
                }
              },
              leading: Icon(Icons.photo),
              title: Text("Gallery"),
            ),
          ],
        );
      },
    );
  }

  String wieghtType = "KG";
  String heightType = "CM";
  String? gender;

  selectWeightType(String type) {
    wieghtType = type;
    setState(() {});
  }

  selectHeightType(String type) {
    heightType = type;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            backgroundImage(context),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: SafeArea(
                child: Column(
                  children: [
                    //todo -------------> app bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            CupertinoIcons.back,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              context.translator.editProfTitle,
                              // translator.getString("EditProf.title"),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
                    // const SizedBox(height: 25),
                    Gap(size.height * 0.012),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: GestureDetector(
                                onTap: () => openOptions(context, size),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    editprofileController.ispictureLoading.value
                                        ? CircleAvatar(
                                            radius: size.width * 0.169,
                                            backgroundColor: Colors.orange,
                                            child: CircularProgressIndicator(),
                                          )
                                        : mainscreenController
                                                .userdetailList.isNotEmpty
                                            ? mainscreenController
                                                            .userdetailList[0]
                                                            .profilePicture !=
                                                        null &&
                                                    mainscreenController
                                                            .userdetailList[0]
                                                            .profilePicture !=
                                                        ""
                                                ? CircleAvatar(
                                                    radius: size.width * 0.169,
                                                    backgroundColor:
                                                        Colors.orange,
                                                    backgroundImage:
                                                        NetworkImage(mainUrl +
                                                            imageUrl +
                                                            mainscreenController
                                                                .userdetailList[
                                                                    0]
                                                                .profilePicture!),
                                                  )
                                                : CircleAvatar(
                                                    radius: size.width * 0.169,
                                                    backgroundColor:
                                                        Colors.orange,
                                                    backgroundImage: AssetImage(
                                                        "assets/images/profIcon.png"),
                                                  )
                                            : CircleAvatar(
                                                radius: size.width * 0.169,
                                                backgroundColor: Colors.orange,
                                                backgroundImage: AssetImage(
                                                    "assets/images/profIcon.png"),
                                              ),
                                    Positioned(
                                      right: 3,
                                      bottom: 3,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: Icon(
                                          CupertinoIcons.camera,
                                          color: Colors.blue,
                                          size: size.width * 0.065,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(25),
                            Text(
                              context.translator.editProfName,
                              // translator.getString("EditProf.name"),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const Gap(5),
                            InputField(
                              color: Colors.grey.shade50,
                              size: 50,
                              borderRadius: 5,
                              controller: editprofileController.name,
                              borderColor: Colors.grey.shade300,
                              hint: context.translator.editProfNameHint,
                              //ranslator.getString("EditProf.nameHint"),
                              type: TextInputType.name,
                              icon: Icons.person,
                            ),
                            const Gap(15),
                            Text(
                              context.translator.editProfPhone,
                              // translator.getString("EditProf.phone"),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const Gap(5),
                            InputField(
                              color: Colors.grey.shade50,
                              size: 50,
                              controller: editprofileController.phoneNo,
                              borderRadius: 5,
                              borderColor: Colors.grey.shade300,
                              hint: context.translator.editProfPhoneHint,
                              //ranslator.getString("EditProf.phoneHint"),
                              type: TextInputType.phone,
                              icon: Icons.phone_android,
                            ),
                            const Gap(15),
                            Text(
                              context.translator.editProfMail,
                              // translator.getString("EditProf.mail"),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const Gap(5),
                            InputField(
                              color: Colors.grey.shade50,
                              size: 50,
                              borderRadius: 5,
                              controller: editprofileController.email,
                              borderColor: Colors.grey.shade300,
                              hint: context.translator.editProfMailHint,
                              //translator.getString("EditProf.mailHint"),
                              type: TextInputType.emailAddress,
                              icon: Icons.mail,
                            ),
                            const Gap(15),
                            Text(
                              context.translator.editProfWeight,
                              // translator.getString("EditProf.weight"),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const Gap(5),
                            Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InputField(
                                      color: Colors.grey.shade50,
                                      size: 30,
                                      borderRadius: 5,
                                      controller: editprofileController.weight,
                                      borderColor: Colors.grey.shade50,
                                      hint: "0",
                                      type: TextInputType.number,
                                    ),
                                  ),
                                  SelectionType(
                                    types: ["LBS", "KG"],
                                    selected: wieghtType,
                                    onTap: selectWeightType,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ),
                            const Gap(15),
                            Text(
                              context.translator.editProfHeight,
                              // translator.getString("EditProf.height"),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const Gap(5),
                            Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InputField(
                                      color: Colors.grey.shade50,
                                      size: 30,
                                      controller: editprofileController.height,
                                      borderRadius: 5,
                                      borderColor: Colors.grey.shade50,
                                      hint: "0",
                                      type: TextInputType.number,
                                    ),
                                  ),
                                  SelectionType(
                                    types: ["FEET", "CM"],
                                    selected: heightType,
                                    onTap: selectHeightType,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ),
                            const Gap(15),
                            Text(
                              context.translator.editProfGender,
                              // translator.getString("EditProf.gender"),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const Gap(5),
                            MyDropdown(
                              value: editprofileController.gender.value,
                              items: ["Male", "Female"],
                              title: ["Male", "Female"],
                              color: Colors.grey.shade50,
                              size: 45,
                              borderRadius: 5,
                              borderColor: Colors.grey.shade300,
                              hint: context.translator.editProfGenderHint,
                              //translator.getString("EditProf.genderHint"),
                              icon: Icons.account_circle,
                              onChanged: (g) {
                                editprofileController.gender.value =
                                    g.toString();
                                setState(() {});
                              },
                            ),
                            const Gap(15),
                            Text(
                              context.translator.editProfAge,
                              // translator.getString("EditProf.age"),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const Gap(5),
                            InputField(
                              color: Colors.grey.shade50,
                              size: 50,
                              borderRadius: 5,
                              borderColor: Colors.grey.shade300,
                              hint: context.translator.editProfAgeHint,
                              //translator.getString("EditProf.ageHint"),
                              type: TextInputType.number,
                              icon: Icons.date_range,
                            ),
                            const Gap(15),
                            MyButton(
                              fontSize: 22,
                              sizeHieght: 50,
                              fontWeight: FontWeight.w400,
                              title: editprofileController.isLoading.value
                                  ? context.translator
                                      .editProfTextButtonSaving //translator.getString("EditProf.textButtonSaving")
                                  : context.translator.editProfTextButton,
                              //translator.getString("EditProf.textButton"),
                              onTap: () {
                                editprofileController.editProfile(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
