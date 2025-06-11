import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/utils/global.dart';
import '../controllers/home/homeTab_controller.dart';

class GoalScreen extends StatelessWidget {
  GoalScreen({super.key});

  final homeController = Get.find<HomeScreenController>();
  late List<Map<String, dynamic>> tabs;

  @override
  Widget build(BuildContext context) {
    tabs = [
      {
        "title": context.translator.mainTab1,
        "icon": "assets/images/home.png",
      },
      // {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
      {
        "title": context.translator.mainTab3,
        "icon": "assets/images/settings.png"
      },
      // {
      //   "title": context.translator.mainTab2,
      //   "icon": "assets/images/dumble.png"
      // },
      {
        "title": context.translator.mainTab4,
        "icon": "assets/images/profile.png"
      },
    ];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(context),
          SafeArea(
            child: Obx(() {
              return Padding(
                padding: const EdgeInsets.fromLTRB(11, 5, 11, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyAppBar(),
                    Gap(size.height * 0.014),
                    Text(context.translator.profileGoal,style: TextStyle(fontSize: size.width * 0.05),),
                    //todo ----------> Metrics
                    homeController.goals.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(left: 5, top: 5),
                            child: Text(homeController.goals[0]),
                          )
                        : const Center(child: Text('No Goal Available')),
                  ],
                ),
              );
            }),
          ),
        ],
      ),

      bottomNavigationBar: MyBottomNavBar(tabs: tabs,index: 2,),
    );
  }
}
