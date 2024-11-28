import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/DaySelection.dart';
import 'package:sportperformance/Screens/PlanScreen.dart';
import 'package:sportperformance/Utils/Color.dart';
import 'package:sportperformance/controllers/home/entertainment_controller.dart';
import 'package:sportperformance/main.dart';

class EntertainmentScreen extends StatefulWidget {
  static const routeName = "EntertainmentScreen";
  @override
  State<EntertainmentScreen> createState() => _EntertainmentScreenState();
}

class _EntertainmentScreenState extends State<EntertainmentScreen> {
  final translator = TranslatorGenerator.instance;
  DateTime selectedDate = DateTime.now();
  late ScrollController _controller;
  int currentPage = 0;
  final entertainmentController = Get.put(EntertainmentController());
  final List<Map<String, dynamic>> tabs = [
    {"title": "Main.tab1", "icon": "assets/images/home.png"},
    {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
    {"title": "Main.tab3", "icon": "assets/images/settings.png"},
    {"title": "Main.tab4", "icon": "assets/images/profile.png"},
  ];
  changeTab(int page) {
    currentPage = page;
    setState(() {});
  }

  // List<Map<String, dynamic>> plans = [
  //   {'title': 'Prensa de Piernas', 'seat': '5'},
  //   {'title': 'Estocada Trasera con KB', 'seat': '5'},
  //   {'title': 'Hack Squat', 'seat': '5'},
  //   {'title': 'Front Rack Box Squat', 'seat': '5'},
  //   {'title': 'Front Rack Box Squat', 'seat': '5'},
  //   {'title': 'Front Rack Box Squat', 'seat': '5'},
  // ];

  // List<Map<String, dynamic>> workout = [
  //   {'image': 'assets/images/item2.png', 'title': 'How to do Push ups'},
  //   {'image': 'assets/images/item3.png', 'title': 'How to do Push ups'},
  //   {'image': 'assets/images/item5.png', 'title': 'How to do Push ups'},
  // ];
  String dateFormatter(DateTime date) {
    dynamic dayData =
        '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thur", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

    dynamic monthData =
        '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

    return json.decode(dayData)['${date.weekday}'] +
            ", " +
            date.day.toString() +
            " " +
            json.decode(monthData)['${date.month}']
        // +
        // " " +
        // date.year.toString()
        ;
  }

  @override
  void initState() {
    _controller = ScrollController(
        keepScrollOffset: true,
        initialScrollOffset: (30 *
                (selectedDate.day +
                    (selectedDate.day < 5
                        ? selectedDate.day - 2.5
                        : (selectedDate.day / 10).round() == 1
                            ? selectedDate.day - 2
                            : (selectedDate.day / 10).round() == 2
                                ? selectedDate.day - 1
                                : (selectedDate.day + 1))))
            .toDouble());
    super.initState();
  }

  String compareDateWithCurrent(String inputDate) {
    final currentDate = DateTime.now();
    final parsedDate = DateTime.parse(inputDate);

    if (parsedDate.isBefore(currentDate)) {
      return "Past";
    } else if (parsedDate.isAfter(currentDate)) {
      return "Future";
    } else {
      return "Current";
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Stack(
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
          //tod -----------> logo
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: size.width / 2.5,
                      height: 60,
                      fit: BoxFit.fill,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/tool.png",
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlanScree(changeTab),
                                ));
                            //Get.toNamed('/goal-screen');
                          },
                          child: Image.asset(
                            "assets/images/tool.png",
                            width: 30,
                            height: 30,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Get.toNamed('/notification');
                            // Navigator.of(context).pushNamed(
                            //   NotificationScreen.routeName,
                            // );
                          },
                          child: Image.asset(
                            "assets/images/notification.png",
                            width: 25,
                            height: 25,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Obx(() {
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            translator.getString("Home.item1"),
                            // translator.getString("Entertainment.title"),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          const SizedBox(width: 30),
                          Container(
                            transform: Matrix4.translationValues(-15, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (selectedDate.month != 1) {
                                      selectedDate = DateTime(
                                        selectedDate.year,
                                        selectedDate.month - 1,
                                        selectedDate.day,
                                      );
                                      setState(() {});
                                    } else {
                                      selectedDate = DateTime(
                                        selectedDate.year - 1,
                                        12,
                                        selectedDate.day,
                                      );
                                      setState(() {});
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Theme.of(context).iconTheme.color,
                                    size: 15,
                                  ),
                                ),
                                Text(
                                  formatDate(selectedDate, [MM, "  ", yyyy]),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (selectedDate.month != 12) {
                                      selectedDate = DateTime(
                                        selectedDate.year,
                                        selectedDate.month + 1,
                                        selectedDate.day,
                                      );
                                      setState(() {});
                                    } else {
                                      selectedDate = DateTime(
                                        selectedDate.year + 1,
                                        1,
                                        selectedDate.day,
                                      );
                                      setState(() {});
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Theme.of(context).iconTheme.color,
                                    size: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          SingleChildScrollView(
                            controller: _controller,
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                              spacing: 10,
                              children: List.generate(
                                DateTime(selectedDate.year,
                                        selectedDate.month + 1, 0)
                                    .day,
                                (index) => DaySelection(
                                  selectedDate: selectedDate,
                                  day: index + 1,
                                  onTap: () {
                                    selectedDate = DateTime(
                                      selectedDate.year,
                                      selectedDate.month,
                                      index + 1,
                                    );
                                    setState(() {});
                                    print(selectedDate);
                                    entertainmentController.selectedDate.value =
                                        "${selectedDate.year}-${(selectedDate.month).toString().padLeft(2, '0')}-${selectedDate.day}";
                                    entertainmentController.getCalenderData(
                                        entertainmentController
                                            .selectedDate.value);
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            translator.getString("Entertainment.workPlan"),
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          const SizedBox(height: 25),
                          entertainmentController.isLoading.value
                              ? Text('Loading')
                              : entertainmentController.calenderList.isEmpty
                                  ? Center(child: Text('No WorkOut For today'))
                                  : InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                          '/workout-detail-screen',
                                        );
                                      },
                                      child: Container(
                                        width: size.width,
                                        height: size.height * 0.23,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: primaryColor,
                                                width: 0.5)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: primaryColor
                                                    .withOpacity(0.2),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(15),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${dateFormatter(selectedDate)}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    ),
                                                    entertainmentController
                                                            .calenderList[0]
                                                            .isComplete
                                                        ? CircleAvatar(
                                                            child: Icon(
                                                              Icons.check,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          )
                                                        : compareDateWithCurrent(
                                                                    entertainmentController
                                                                        .selectedDate
                                                                        .value) ==
                                                                'Past'
                                                            ? CircleAvatar(
                                                                child: Icon(
                                                                  Icons.cancel,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                              )
                                                            : CircleAvatar(
                                                                child: Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .orange,
                                                                ),
                                                              )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Text(
                                                entertainmentController
                                                        .calenderList[0]
                                                        .title ??
                                                    'Rest Day',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayLarge,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                          // SizedBox(
                          //   height: 250,
                          //   child: GridView.builder(
                          //     shrinkWrap: true,
                          //     itemCount: plans.length,
                          //     scrollDirection: Axis.horizontal,
                          //     gridDelegate:
                          //         SliverGridDelegateWithFixedCrossAxisCount(
                          //       crossAxisCount: 2,
                          //       crossAxisSpacing: 15,
                          //       mainAxisSpacing: 15,
                          //       childAspectRatio: 120 / (size.width / 2.5),
                          //     ),
                          //     itemBuilder: (ctx, i) => WorkoutPlan(
                          //       title: plans[i]['title'],
                          //       seat: plans[i]['seat'],
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(height: 25),
                          // Text(
                          //   translator.getString("Entertainment.visualize"),
                          //   style:
                          //       Theme.of(context).textTheme.bodyLarge!.copyWith(
                          //             fontSize: 16,
                          //             fontWeight: FontWeight.w600,
                          //           ),
                          // ),
                          // const SizedBox(height: 25),
                          // SingleChildScrollView(
                          //   scrollDirection: Axis.horizontal,
                          //   child: Wrap(
                          //     spacing: 25,
                          //     children: List.generate(
                          //       workout.length,
                          //       (i) => Workout(
                          //         image: workout[i]['image'],
                          //         title: workout[i]['title'],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconSize: 30,
        selectedItemColor: Theme.of(context).primaryColorLight,
        unselectedItemColor: Colors.grey,
        onTap: (page) => Navigator.of(context).pop(page),
        items: List.generate(
          tabs.length,
          (index) => BottomNavigationBarItem(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            icon: ImageIcon(AssetImage(tabs[index]['icon'])),
            label: translator.getString(tabs[index]['title']),
          ),
        ),
      ),
    );
  }
}
