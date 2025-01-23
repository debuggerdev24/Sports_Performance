import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/snackbar.dart';
import 'package:sportperformance/utils/global.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Components/VideoPlay.dart';
import '../Components/Workout.dart';
import '../Utils/color.dart';
import '../Utils/utils.dart';
import '../controllers/home/entertainment_controller.dart';

class WorkoutDetailPage extends StatefulWidget {
  WorkoutDetailPage({super.key});

  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
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

  List<Map<String, dynamic>> workout = [
    {'image': 'assets/images/item2.png', 'title': 'How to do Push ups'},
    {'image': 'assets/images/item3.png', 'title': 'How to do Push ups'},
    {'image': 'assets/images/item5.png', 'title': 'How to do Push ups'},
  ];

  final entertainmentController = Get.find<EntertainmentController>();

  String formatDate(String inputDate) {
    final parsedDate = DateTime.parse(inputDate);
    final formattedWeekday = DateFormat.E().format(parsedDate); // Sat
    final formattedMonth = DateFormat.MMM().format(parsedDate); // Jul
    final formattedDay = DateFormat.d().format(parsedDate); // 29

    return '$formattedWeekday, $formattedMonth $formattedDay';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translator.workOut),
      ),
      body: Stack(
        children: [
          backgroundImage(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 8, 11, 5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatDate(entertainmentController
                                    .selectedDate.value) ??
                                'Sat ,Jul 29',
                            style: TextStyle(
                                fontSize: size.width * 0.06,
                                fontWeight: FontWeight.w600,
                                fontFamily: "DMSans",
                                color: darkMode.value
                                    ? Colors.white70
                                    : Colors.black54),
                          ),
                          Text(
                            '${entertainmentController.calenderList[0].exerciseCircuit.length} Exercise',
                            style: TextStyle(
                                fontSize: size.width * 0.038,
                                fontWeight: FontWeight.w500,
                                color: darkMode.value
                                    ? Colors.white70
                                    : Colors.black54),
                          ),
                        ],
                      ),
                      entertainmentController.calenderList[0].isComplete
                          ? CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.withOpacity(0.1),
                              child: Icon(
                                Icons.check,
                                size: 30,
                                color: Colors.green,
                              ),
                            )
                          : CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.withOpacity(0.1),
                              child: Icon(
                                Icons.cancel_rounded,
                                size: 30,
                                color: Colors.red,
                              ),
                            )
                      // Image.asset(
                      //   'assets/images/tick.png',
                      //   height: 25,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // WorkoutCard(size: size, workout: workout),
                  Column(
                      children: entertainmentController
                          .calenderList[0].exerciseCircuit
                          .map((e) => WorkoutCard(
                                size: size,
                                workout: e.videoImage ?? '',
                                title: e.title ?? '',
                                video: e.videoLink ?? '',
                                instructions: e.instruction ?? '',
                                steps: e.steps ?? '',
                                isComplete: entertainmentController
                                    .calenderList[0].isComplete,
                                metric: e.metric ?? '',
                              ))
                          .toList()),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Container(
          width: size.width * 0.8,
          // height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              backgroundColor: secondaryColor,
            ),
            onPressed: !entertainmentController.calenderList[0].isComplete
                ? compareDateWithCurrent(
                            entertainmentController.selectedDate.value) ==
                        "Future"
                    ? () {
                        snackbar(
                            context: context,
                            msg: 'Cannot complete up coming workout',
                            title: "Failed");
                      }
                    : () {
                        entertainmentController.markComplete(
                            entertainmentController.calenderList[0].id);
                      }
                : () {},
            child: entertainmentController.calenderList[0].isComplete
                ? Text(
                    "Completed",
                    style: TextStyle(
                      fontFamily: "DMSans",
                    ),
                  )
                : Text(
                    "Complete Workout",
                    style: TextStyle(
                        fontSize: size.width * 0.038,
                        fontFamily: "DMSans",
                        color: Colors.black87),
                  ),
          ),
        ),
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    Key? key,
    required this.size,
    required this.workout,
    required this.title,
    required this.steps,
    required this.instructions,
    required this.isComplete,
    required this.metric,
    required this.video,
  }) : super(key: key);

  final Size size;
  final String workout;
  final String title;
  final dynamic steps;
  final String instructions;
  final String metric;
  final String video;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: size.width,
        // height: size.height * 0.23,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: primaryColor.withOpacity(0.2),
                  spreadRadius: 2)
            ],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor, width: 0.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      child: Text(
                        'i',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(color: Colors.black),
                    ),
                    isComplete
                        ? CircleAvatar(
                            radius: 12,
                            child: Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.green,
                            ),
                          )
                        : CircleAvatar(
                            radius: 12,
                            child: Icon(
                              Icons.cancel_rounded,
                              size: 20,
                              color: Colors.red,
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'Run + Squat + Burpee',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  Wrap(spacing: 25, children:
                          // List.generate(
                          //   workout.length,
                          //   (i) =>
                          [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Workout(
                          height: 160,
                          width: size.width * 0.85,
                          video: video,
                          image: workout,
                          title: title,
                          // image: workout[i]['image'],
                          // title: workout[i]['title'],
                        ),
                        InkWell(
                          onTap: () {
                            Utils.showMyDialog(
                              context,
                              VideoPlay(
                                  video: YoutubePlayer.convertUrlToId(
                                      video.toString())),
                              padding: EdgeInsets.zero,
                            );
                          },
                          child: CircleAvatar(
                            radius: 17,
                            child: Icon(
                              Icons.play_arrow_sharp,
                              size: 30,
                              color: Colors.deepPurple,
                            ),
                          ),
                        )
                      ],
                    ),
                  ]
                      //),
                      ),
                  // ),
                  SizedBox(
                    height: 28,
                  ),
                  if (steps != '') MyWidget1(steps: steps),
                  if (instructions != '') MyWidget(instructions: instructions),
                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.folder_copy,
                  //       color: Colors.deepPurple,
                  //     ),
                  //     SizedBox(
                  //       width: 8,
                  //     ),
                  //     Text(
                  //       'INSTRUCTIONS',
                  //       style: TextStyle(
                  //         color: Colors.deepPurple,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  if (metric != '')
                    Row(
                      children: [
                        Text(
                          "Metrics :-",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          " $metric",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  final String instructions;

  const MyWidget({
    Key? key,
    required this.instructions,
  }) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with TickerProviderStateMixin {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color primaryColor = Colors.blue; // Replace with your primary color

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        width: size.width,
        // height: size.height * 0.23,
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.04),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'INSTRUCTIONS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      isExpanded
                          ? Icons.arrow_drop_up_outlined
                          : Icons.arrow_drop_down_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 300),
              child: Container(
                height: isExpanded ? null : 0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.instructions,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyWidget1 extends StatefulWidget {
  final String steps;

  const MyWidget1({
    Key? key,
    required this.steps,
  }) : super(key: key);

  @override
  _MyWidget1State createState() => _MyWidget1State();
}

class _MyWidget1State extends State<MyWidget1> with TickerProviderStateMixin {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color primaryColor = Colors.blue; // Replace with your primary color

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        width: size.width,
        // height: size.height * 0.23,
        decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.04),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primaryColor, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'INSTRUCTIONS',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      isExpanded
                          ? Icons.arrow_drop_up_outlined
                          : Icons.arrow_drop_down_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 300),
              child: Container(
                height: isExpanded ? null : 0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.steps,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
