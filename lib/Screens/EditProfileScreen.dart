import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportperformance/Utils/url.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Components/InputFeild.dart';
import 'package:sportperformance/Components/MyButtton.dart';
import 'package:sportperformance/Components/MyDropdown.dart';
import 'package:sportperformance/Components/SelectionType.dart';

import '../controllers/main_screen_controller.dart';
import '../controllers/profile/editProfile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = "EditProfileScreen";
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final translator = TranslatorGenerator.instance;
  final editprofileController = Get.put(EditProfileController());
  final mainscreenController = Get.find<MainScreenController>();

  final _formKey = GlobalKey<FormState>();
  File? image;

  // final pref = GetStorage();

  getGalaryImage() async {
    dynamic imageData = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
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

  void openOptions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Profile photo',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  // Column(
                  //   children: [
                  //     IconButton(
                  //       onPressed: () async {
                  //         await getCamImage();
                  //         if (image != null) {
                  //           editprofileController.uploadProfileImage(
                  //               image!.path, context);
                  //           Navigator.pop(context);
                  //         }
                  //       },
                  //       icon: const Icon(Icons.photo_camera),
                  //     ),
                  //     const Text('Camera')
                  //   ],
                  // ),
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await getGalaryImage();
                          if (image != null) {
                            print('gallery image');
                            if (image != null) {
                              editprofileController.uploadProfileImage(
                                  image!.path, context);
                              Navigator.pop(context);
                            }
                          }
                        },
                        icon: const Icon(Icons.photo),
                      ),
                      const Text('Gallery')
                    ],
                  ),
                ],
              )
            ],
          ),
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(darkMode.value
                      ? "assets/images/darkBg.png"
                      : "assets/images/bgImage.PNG"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: Column(
                children: [
                  const SizedBox(height: 30),
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
                            translator.getString("EditProf.title"),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                editprofileController.ispictureLoading.value
                                    ? CircleAvatar(
                                        radius: 60,
                                        backgroundColor: Colors.orange,
                                        child: CircularProgressIndicator(),
                                      )
                                    : mainscreenController
                                            .userdetailList.isNotEmpty
                                        ? mainscreenController.userdetailList[0]
                                                        .profilePicture !=
                                                    null &&
                                                mainscreenController
                                                        .userdetailList[0]
                                                        .profilePicture !=
                                                    ""
                                            ? CircleAvatar(
                                                radius: 60,
                                                backgroundColor: Colors.orange,
                                                backgroundImage: NetworkImage(
                                                    mainUrl +
                                                        imageUrl +
                                                        mainscreenController
                                                            .userdetailList[0]
                                                            .profilePicture!),
                                              )
                                            : CircleAvatar(
                                                radius: 60,
                                                backgroundColor: Colors.orange,
                                                backgroundImage: AssetImage(
                                                    "assets/images/profIcon.png"),
                                              )
                                        : CircleAvatar(
                                            radius: 60,
                                            backgroundColor: Colors.orange,
                                            backgroundImage: AssetImage(
                                                "assets/images/profIcon.png"),
                                          ),
                                Container(
                                  child: IconButton(
                                    onPressed: () {
                                      openOptions(context);
                                    },
                                    icon: Icon(
                                      CupertinoIcons.camera_fill,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            translator.getString("EditProf.name"),
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          const SizedBox(height: 5),
                          InputField(
                            color: Colors.grey.shade50,
                            size: 50,
                            borderRadius: 5,
                            controller: editprofileController.name,
                            borderColor: Colors.grey.shade300,
                            hint: translator.getString("EditProf.nameHint"),
                            type: TextInputType.name,
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            translator.getString("EditProf.phone"),
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          const SizedBox(height: 5),
                          InputField(
                            color: Colors.grey.shade50,
                            size: 50,
                            controller: editprofileController.phoneNo,
                            borderRadius: 5,
                            borderColor: Colors.grey.shade300,
                            hint: translator.getString("EditProf.phoneHint"),
                            type: TextInputType.phone,
                            icon: Icons.phone_android,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            translator.getString("EditProf.mail"),
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          const SizedBox(height: 5),
                          InputField(
                            color: Colors.grey.shade50,
                            size: 50,
                            borderRadius: 5,
                            controller: editprofileController.email,
                            borderColor: Colors.grey.shade300,
                            hint: translator.getString("EditProf.mailHint"),
                            type: TextInputType.emailAddress,
                            icon: Icons.mail,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            translator.getString("EditProf.weight"),
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          const SizedBox(height: 5),
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
                          const SizedBox(height: 15),
                          Text(
                            translator.getString("EditProf.height"),
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          const SizedBox(height: 5),
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
                          const SizedBox(height: 15),
                          Text(
                            translator.getString("EditProf.gender"),
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          const SizedBox(height: 5),
                          MyDropdown(
                            value: editprofileController.gender.value,
                            items: ["Male", "Female"],
                            title: ["Male", "Female"],
                            color: Colors.grey.shade50,
                            size: 45,
                            borderRadius: 5,
                            borderColor: Colors.grey.shade300,
                            hint: translator.getString("EditProf.genderHint"),
                            icon: Icons.account_circle,
                            onChanged: (g) {
                              editprofileController.gender.value = g.toString();
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 15),
                          Text(
                            translator.getString("EditProf.age"),
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          const SizedBox(height: 5),
                          InputField(
                            color: Colors.grey.shade50,
                            size: 50,
                            borderRadius: 5,
                            borderColor: Colors.grey.shade300,
                            hint: translator.getString("EditProf.ageHint"),
                            type: TextInputType.number,
                            icon: Icons.date_range,
                          ),
                          const SizedBox(height: 15),
                          MyButton(
                            fontSize: 22,
                            sizeHieght: 50,
                            fontWeight: FontWeight.w400,
                            title: editprofileController.isLoading.value
                                ? translator
                                    .getString("EditProf.textButtonSaving")
                                : translator.getString("EditProf.textButton"),
                            onTap: () {
                              editprofileController.editprofile(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
