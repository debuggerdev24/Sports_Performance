import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sportperformance/Components/MyButtton.dart';
import 'package:sportperformance/extensions/context_extension.dart';

class GettingStartScreen extends StatefulWidget {
  @override
  State<GettingStartScreen> createState() => _GettingStartScreenState();
}

class _GettingStartScreenState extends State<GettingStartScreen> {
  ////final translator = TranslatorGenerator.instance;



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splashBg.PNG"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 60),
              SizedBox(
                width: size.width / 1.1,
                height: size.height / 3,
                child: Image.asset(
                  "assets/images/splash.png",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: size.width / 1.4,
                height: size.height / 7,
                child: Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: size.width / 1.2,
                child: Text(
                  context.translator.gettingStartedSpecialized,
                  // translator.getString("GettingStarted.specialized"),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              MyButton(
                fontSize: 14,
                sizeHieght: 50,
                title: context.translator.gettingStartedStart,//translator.getString("GettingStarted.start"),
                sizeWidth: size.width / 2.5,
                onTap: () {
                  GetStorage().write('onboarding', true);
                  Get.offAndToNamed('/login', arguments: [context]);
                  // Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
