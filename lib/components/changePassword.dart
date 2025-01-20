import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/InputFeild.dart';
import 'package:sportperformance/Components/MyButtton.dart';
import 'package:sportperformance/controllers/profile/setting_controller.dart';
import 'package:sportperformance/utils/global.dart';

import '../snackbar.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final _formKey = GlobalKey<FormState>();
  final settingController = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            CupertinoIcons.back,
            size: 20,
          ),
        ),
        title: Text(
          "Change Password",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        children: [
          backgroundImage(context),
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Obx(() {
              return Form(
                key: _formKey,
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: size.height * 0.05,
                    // ),
                    Center(
                      child: Text(
                        "Setup your New Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Current Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    InputField(
                      color: Colors.grey.shade50,
                      size: 50,
                      borderColor: Colors.grey.shade300,
                      hint: "Enter Your Current Password",
                      controller: settingController.current,
                      validator: MultiValidator([
                        // EmailValidator(
                        //   errorText: 'Please enter valid email',
                        // ),
                        RequiredValidator(errorText: 'Current Password required')
                      ]),
                      // type: TextInputType.text,
                      icon: Icons.lock_outline,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "New Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    InputField(
                      color: Colors.grey.shade50,
                      size: 50,
                      controller: settingController.newpass,
                      borderColor: Colors.grey.shade300,
                      hint: "Enter New Password",
                      validator: MultiValidator([
                        // EmailValidator(
                        //   errorText: 'Please enter valid email',
                        // ),
                        MinLengthValidator(6, errorText: 'minimum length 6'),
                        RequiredValidator(errorText: 'New Password required')
                      ]),
                      // type: TextInputType.text,
                      icon: Icons.lock_outline,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Confirm Password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    InputField(
                      color: Colors.grey.shade50,
                      size: 50,
                      borderColor: Colors.grey.shade300,
                      hint: "Enter Confirm Password",
                      controller: settingController.confirmpas,
                      // type: TextInputType.text,
                      validator: MultiValidator([
                        MinLengthValidator(6, errorText: 'minimum length 6'),
                        RequiredValidator(errorText: 'Confirm Password required')
                      ]),
                      icon: Icons.lock_outline,
                    ),
                    const SizedBox(height: 25),
                    MyButton(
                      fontSize: 16,
                      title: settingController.isLoading.value
                          ? 'Please Wait...'
                          : "Submit",
                      fontWeight: FontWeight.w700,
                      textColor: Colors.white,
                      sizeHieght: 50,
                      onTap: () {
                        if (settingController.newpass.text ==
                            settingController.confirmpas.text) {
                          if (_formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            settingController.changepass(context);
                          }
                        } else {
                          snackbar(
                              context: context,
                              msg: 'Passwords does not matched',
                              title: 'Failed');
                        }
                      },
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
