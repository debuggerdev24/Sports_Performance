import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/Utils/utils.dart';
import 'package:sportperformance/Components/MyButtton.dart';
import 'package:sportperformance/Components/InputFeild.dart';
import 'package:sportperformance/Components/ForgotPassword.dart';

import '../controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // //final translator = TranslatorGenerator.instance;



  final _formKey = GlobalKey<FormState>();
  final logincontroller = Get.put(LoginController(context: Get.arguments[0]));

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return Scaffold(
      body: Obx(() {
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Stack(
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
                SingleChildScrollView(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      //todo --------------------> First image
                      Image.asset(
                        "assets/images/logo.png",
                        width: size.width / 1.5,
                        height: size.height / 8,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "${context.translator.loginTitle1}\n${context.translator.loginTitle2}",
                        // "${translator.getString("login.title1")}\n${translator.getString("login.title2")}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        context.translator.loginEmail, //translator.getString("login.email",),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: 5),
                      // ---------------------> email textfield
                      InputField(
                        size: 50,
                        controller: logincontroller.email,
                        borderRadius: 5,
                        icon: Icons.mail,
                        validator: MultiValidator([
                          EmailValidator(
                            errorText: 'Please enter valid email',
                          ),
                          RequiredValidator(errorText: 'Email required')
                        ]),
                        hint: context.translator.loginEmailHint,//translator.getString("login.emailHint"),
                        borderColor: Colors.grey,
                        color: Colors.grey.shade50,
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        context.translator.loginPassword,//translator.getString("login.password"),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: 5),
                      // ---------------------> password textfield
                      InputField(
                        color: Colors.grey.shade50,
                        size: 50,
                        controller: logincontroller.password,
                        password: true,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Password required')
                        ]),
                        borderRadius: 5,
                        icon: Icons.lock,
                        borderColor: Colors.grey,
                        hint: context.translator.loginPasswordHint,//translator.getString("login.passwordHint"),
                        type: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 25),
                      InkWell(
                        onTap: () {
                          Utils.showMyDialog(context, ForgotPassword());
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            context.translator.loginForgotPass,//translator.getString("login.forgotPass"),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 70),
                      MyButton(
                        fontSize: 19,
                        sizeHieght: 50,
                        fontWeight: FontWeight.w400,
                        title: logincontroller.isLoading.value
                            ? context.translator.processing//translator.getString("processing")
                            : context.translator.loginTextButton,//translator.getString("login.textButton"),
                        onTap: () {
                          // Get.offAllNamed('/main-screen', arguments: [context]);
                          if (_formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            logincontroller.login(context);
                          }
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          // Navigator.of(context).pushReplacementNamed(
                          //   MainScreen.routeName,
                          // );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}