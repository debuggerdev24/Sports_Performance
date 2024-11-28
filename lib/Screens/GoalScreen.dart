import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers/home/homeTab_controller.dart';

class GoalScreen extends StatelessWidget {
  GoalScreen({super.key});
  final homeController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Goals',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(() {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: homeController.goals.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (context, index) =>
                        Text(homeController.goals[0]),
                  )
                : Text('No Goal Available'),
          ),
        );
      }),
    );
  }
}
