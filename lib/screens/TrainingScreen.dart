import 'dart:convert';
import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:sportperformance/Components/DaySelection.dart';
import 'package:sportperformance/Utils/color.dart';
import 'package:sportperformance/controllers/home/entertainment_controller.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import 'package:sportperformance/utils/global.dart';

class TrainingScreen extends StatefulWidget {
  static const routeName = "EntertainmentScreen";

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  //final translator = TranslatorGenerator.instance;

  DateTime selectedDate = DateTime.now();
  late ScrollController _controller;
  int currentPage = 0;
  final entertainmentController = Get.put(EntertainmentController());
  late List<Map<String, dynamic>> tabs;

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
    tabs = [
      {"title": context.translator.mainTab1, "icon": "assets/images/home.png"},
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
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 0, 11, 5),
            child: SafeArea(
              child: Column(
                children: [
                  //todo -----------> appBar
                  const MyAppBar(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Image.asset(
                          //       "assets/images/logo.png",
                          //       width: size.width / 2.5,
                          //       height: 60,
                          //       fit: BoxFit.fill,
                          //     ),
                          //     Row(
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //         InkWell(
                          //           onTap: () {
                          //             Get.toNamed('/entertainment-screen');
                          //           },
                          //           child: Image.asset(
                          //             "assets/images/tool.png",
                          //             width: 30,
                          //             height: 30,
                          //             fit: BoxFit.fill,
                          //           ),
                          //         ),
                          //         SizedBox(width: 8),
                          //         InkWell(
                          //           onTap: () {
                          //             Get.toNamed('/nutrition-screen');
                          //           },
                          //           child: Image.asset(
                          //             darkMode.value
                          //                 ? "assets/images/plans_darkmode.png"
                          //                 : "assets/images/plans.png", //"assets/images/trools.png",
                          //             height: 26,
                          //             fit: BoxFit.fill,
                          //           ),
                          //         ),
                          //         SizedBox(width: 5.5),
                          //         InkWell(
                          //           onTap: () {
                          //             Get.toNamed('/notification');
                          //           },
                          //           child: Image.asset(
                          //             darkMode.value
                          //                 ? "assets/images/notifi_darkmode.png"
                          //                 : "assets/images/notifi.png",
                          //             //"assets/images/notification.png",
                          //             height: 28,
                          //             fit: BoxFit.fill,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     // Row(
                          //     //   spacing: 10,
                          //     //   mainAxisSize: MainAxisSize.min,
                          //     //   children: [
                          //     //     Image.asset(
                          //     //       "assets/images/tool.png",
                          //     //       width: 30,
                          //     //       height: 30,
                          //     //       fit: BoxFit.fill,
                          //     //     ),
                          //     //     InkWell(
                          //     //       onTap: () {
                          //     //         Navigator.push(
                          //     //             context,
                          //     //             MaterialPageRoute(
                          //     //               builder: (context) => PlanScree(),
                          //     //             ));
                          //     //         //Get.toNamed('/goal-screen');
                          //     //       },
                          //     //       child: Image.asset(
                          //     //         "assets/images/tool.png",
                          //     //         width: 30,
                          //     //         height: 30,
                          //     //         fit: BoxFit.fill,
                          //     //       ),
                          //     //     ),
                          //     //     InkWell(
                          //     //       onTap: () {
                          //     //         Get.toNamed('/notification');
                          //     //         // Navigator.of(context).pushNamed(
                          //     //         //   NotificationScreen.routeName,
                          //     //         // );
                          //     //       },
                          //     //       child: Image.asset(
                          //     //         "assets/images/notification.png",
                          //     //         width: 25,
                          //     //         height: 25,
                          //     //         fit: BoxFit.fill,
                          //     //       ),
                          //     //     ),
                          //     //   ],
                          //     // ),
                          //   ],
                          // ),
                          Gap(size.height * 0.015),
                          Obx(() {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.translator.trainingSession,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: size.width * 0.051,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Gap(size.height * 0.001),
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
                                Gap(size.height * 0.01),
                                //todo -----------> all date list horizontal
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
                                          entertainmentController
                                                  .selectedDate.value =
                                              "${selectedDate.year}-${(selectedDate.month).toString().padLeft(2, '0')}-${selectedDate.day}";
                                          myLog(entertainmentController
                                              .selectedDate.value
                                              .toString());
                                          entertainmentController.getCalenderData(
                                              entertainmentController
                                                  .selectedDate.value);
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(size.height * 0.02),
                                Text(
                                  context.translator.entertainmentWorkPlan,
                                  // translator.getString("Entertainment.workPlan"),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Center(
                                  child: entertainmentController.isLoading.value
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                              top: size.height * 0.1),
                                          child: const Text("Loading..."),
                                        )
                                      : entertainmentController.calenderList.isEmpty
                                          ? Padding(
                                              padding: EdgeInsets.only(top: size.height * 0.1),
                                              child: Text((selectedDate.year ==
                                                          DateTime.now().year &&
                                                      selectedDate.month ==
                                                          DateTime.now().month &&
                                                      selectedDate.day ==
                                                          DateTime.now().day)
                                                  ? "${context.translator.noWorkOutFor} today"
                                                  : "${context.translator.noWorkOutFor} ${DateFormat("dd").format(selectedDate)} ${formatDate(
                                                      selectedDate,
                                                      [MM],
                                                    )} "),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                  '/workout-detail-screen',
                                                );
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(top: 10),
                                                width: size.width,
                                                padding: const EdgeInsets.fromLTRB(
                                                    16, 12, 16, 12),
                                                decoration: BoxDecoration(
                                                  gradient: const LinearGradient(
                                                    colors: [
                                                      Color(0xFFF8F8FF),
                                                      Colors.white
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 10,
                                                      color: primaryColor
                                                          .withOpacity(0.2),
                                                      spreadRadius: 2,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: primaryColor
                                                          .withOpacity(0.2),
                                                      width: 1.5),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          dateFormatter(selectedDate),
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyLarge
                                                              ?.copyWith(
                                                                color:
                                                                    Colors.black87,
                                                                fontSize:
                                                                    size.width *
                                                                        0.045,
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                              ),
                                                        ),
                                                        entertainmentController
                                                                .calenderList[0]
                                                                .isComplete
                                                            ? CircleAvatar(
                                                                backgroundColor:
                                                                    Colors.green
                                                                        .withValues(alpha:
                                                                            0.2),
                                                                child: const Icon(
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
                                                                    backgroundColor:
                                                                        Colors.red
                                                                            .withValues(
                                                                                alpha: 0.2),
                                                                    child: const Icon(
                                                                      Icons.cancel,
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                  )
                                                                : CircleAvatar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .orange
                                                                            .withOpacity(
                                                                                0.2),
                                                                    child: const Icon(
                                                                      Icons.star,
                                                                      color: Colors
                                                                          .orange,
                                                                    ),
                                                                  ),
                                                      ],
                                                    ),
                                                    Text(
                                                      entertainmentController
                                                              .calenderList[0]
                                                              .title ??
                                                          'Rest Day',
                                                      style: TextStyle(
                                                        fontSize:
                                                            size.width * 0.057,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    const Gap(2),
                                                    Text(
                                                      "Warm up - ${entertainmentController.calenderList[0].warmup ?? 'Rest Day'}",
                                                      style: TextStyle(
                                                        fontSize:
                                                            size.width * 0.044,
                                                        color: Colors.black54,
                                                      ),
                                                    ),
                                                    const Gap(5),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          "Start Now ",
                                                          style: TextStyle(
                                                            fontSize:
                                                                size.width * 0.043,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.arrow_forward,
                                                          color: primaryColor,
                                                          size: size.width * 0.05,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                              
                                              // Container(
                                              //   width: size.width,
                                              //   // height: size.height * 0.2,
                                              //   padding: const EdgeInsets.fromLTRB(16,16,16,20),
                                              //   decoration: BoxDecoration(
                                              //     color: Colors.white,
                                              //       boxShadow: [
                                              //         BoxShadow(
                                              //           blurRadius: 10,
                                              //           color: primaryColor.withOpacity(0.2),
                                              //           spreadRadius: 2,
                                              //         )
                                              //       ],
                                              //       borderRadius:
                                              //           BorderRadius.circular(15),
                                              //       border: Border.all(
                                              //           color: primaryColor,
                                              //           width: 0.5)),
                                              //   child: Column(
                                              //     crossAxisAlignment:
                                              //         CrossAxisAlignment.start,
                                              //     children: [
                                              //       Row(
                                              //         mainAxisAlignment:
                                              //             MainAxisAlignment
                                              //                 .spaceBetween,
                                              //         children: [
                                              //           Text(
                                              //             '${dateFormatter(selectedDate)}',
                                              //             style: Theme.of(context)
                                              //                 .textTheme
                                              //                 .bodySmall,
                                              //           ),
                                              //           entertainmentController
                                              //                   .calenderList[0]
                                              //                   .isComplete
                                              //               ? CircleAvatar(
                                              //                   child: Icon(
                                              //                     Icons.check,
                                              //                     color:
                                              //                         Colors.green,
                                              //                   ),
                                              //                 )
                                              //               : compareDateWithCurrent(
                                              //                           entertainmentController
                                              //                               .selectedDate
                                              //                               .value) ==
                                              //                       'Past'
                                              //                   ? CircleAvatar(
                                              //                       child: Icon(
                                              //                         Icons.cancel,
                                              //                         color: Colors
                                              //                             .red,
                                              //                       ),
                                              //                     )
                                              //                   : CircleAvatar(
                                              //                       child: Icon(
                                              //                         Icons.star,
                                              //                         color: Colors
                                              //                             .orange,
                                              //                       ),
                                              //                     )
                                              //         ],
                                              //       ),
                                              //       Text(
                                              //         entertainmentController
                                              //                 .calenderList[0]
                                              //                 .title ??
                                              //             'Rest Day',
                                              //         style: TextStyle(fontSize: size.width * 0.055),
                                              //       ),
                                              //       Text(
                                              //         "Warm up - ${entertainmentController
                                              //             .calenderList[0]
                                              //             .warmup??
                                              //             'Rest Day'}",
                                              //         style: TextStyle(fontSize: size.width * 0.04),
                                              //       ),
                                              //
                                              //     ],
                                              //   ),
                                              // ),
                                              ),
                                ),
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
                                //     spacing: 25,{
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
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(tabs: tabs),
    );
  }
}
//BottomNavigationBar(
//         elevation: 0,
//         selectedFontSize: 10,
//         unselectedFontSize: 10,
//         showUnselectedLabels: true,
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         iconSize: 30,
//         selectedItemColor: Theme.of(context).primaryColorLight,
//         unselectedItemColor: Colors.grey,
//         onTap: (page) {
//           Get.offAll(MainScreen(page));
//           // Widget targetScreen;
//           //
//           // switch (page) {
//           //   case 0:
//           //     targetScreen = HomeScreen(changeTab);
//           //     break;
//           //   case 1:
//           //     targetScreen = ToolsScreen(changeTab);
//           //     break;
//           //   case 2:
//           //     targetScreen = PaymentScreen();
//           //     break;
//           //   case 3:
//           //     targetScreen = ProfileScreen();
//           //     break;
//           //   default:
//           //     targetScreen = SizedBox();
//           // }
//           //
//           // if (targetScreen is Widget && targetScreen is! SizedBox) {
//           //   Navigator.of(context).push(
//           //     MaterialPageRoute(builder: (context) => targetScreen),
//           //   );
//           // }
//         },
//         items: List.generate(
//           tabs.length,
//           (index) => BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             icon: ImageIcon(AssetImage(tabs[index]['icon'])),
//             label: tabs[index]['title'],
//           ),
//         ),
//       )
