import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/utils/global.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../Components/VideoPlay.dart';
import '../Components/Workout.dart';
import '../Utils/color.dart';
import '../Utils/utils.dart';
import '../controllers/home/entertainment_controller.dart';
import '../snackbar.dart';

class WorkoutDetailScreen extends StatefulWidget {
  final int selectedWorkout;
  const WorkoutDetailScreen({super.key, required this.selectedWorkout});

  @override
  State<WorkoutDetailScreen> createState() => _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState extends State<WorkoutDetailScreen> {
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

  // List<Map<String, dynamic>> workout = [
  //   {'image': 'assets/images/item2.png', 'title': 'How to do Push ups'},
  //   {'image': 'assets/images/item3.png', 'title': 'How to do Push ups'},
  //   {'image': 'assets/images/item5.png', 'title': 'How to do Push ups'},
  // ];

  final trainingController = Get.find<EntertainmentController>();

  String formatDate(String inputDate) {
    final parsedDate = DateTime.parse(inputDate);
    final formattedWeekday = DateFormat.E().format(parsedDate); // Sat
    final formattedMonth = DateFormat.MMM().format(parsedDate); // Jul
    final formattedDay = DateFormat.d().format(parsedDate); // 29

    return '$formattedWeekday, $formattedMonth $formattedDay';
  }

  @override
  Widget build(BuildContext context) {
    final exerciseCircuit =
        trainingController.workOutList[widget.selectedWorkout].exerciseCircuit;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translator.workOut),
      ),
      body: Stack(
        children: [
          backgroundImage(context),
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 4, 11, 5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       formatDate(trainingController.selectedDate.value) ??
                  //           'Sat ,Jul 29',
                  //       style: TextStyle(
                  //           fontSize: size.width * 0.06,
                  //           fontWeight: FontWeight.w600,
                  //           fontFamily: "DMSans",
                  //           color: darkMode.value
                  //               ? Colors.white70
                  //               : Colors.black54),
                  //     ),
                  //     // Text(
                  //     //                             '${exerciseCircuit.length} Exercise',
                  //     //                             style: TextStyle(
                  //     //                               fontSize: size.width * 0.038,
                  //     //                               fontWeight: FontWeight.w500,
                  //     //                               color: darkMode.value
                  //     //                                   ? Colors.white70
                  //     //                                   : Colors.black54,
                  //     //                             ),
                  //     //                           ),
                  //     trainingController.workOutList[0].isComplete
                  //         ? CircleAvatar(
                  //             radius: 20,
                  //             backgroundColor:
                  //                 Colors.grey.withValues(alpha: 0.1),
                  //             child: const Icon(
                  //               Icons.check,
                  //               size: 30,
                  //               color: Colors.green,
                  //             ),
                  //           )
                  //         : CircleAvatar(
                  //             radius: 20,
                  //             backgroundColor:
                  //                 Colors.grey.withValues(alpha: 0.1),
                  //             child: const Icon(
                  //               Icons.cancel_rounded,
                  //               size: 30,
                  //               color: Colors.red,
                  //             ),
                  //           )
                  //     // Image.asset(
                  //     //   'assets/images/tick.png',
                  //     //   height: 25,
                  //     // ),
                  //   ],
                  // ),
                  const SizedBox(height: 8),
                  Column(
                      children: List.generate(
                    exerciseCircuit.length,
                    (index) {
                      final e = exerciseCircuit[index];
                      return WorkoutCard(
                        size: size,
                        workout: e.videoLinkThumbnail ?? '',
                        title: e.title ?? '',
                        video: e.videoLink ?? '',
                        instructions: e.instruction ?? '',
                        steps: e.steps ?? '',
                        isComplete:
                            trainingController.workOutList[0].burn == "1",
                        metric: e.metric ?? '',
                        index: index + 1,
                        coolDown: trainingController
                            .workOutList[widget.selectedWorkout].cooldown,
                      );
                    },
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(14.0),
      //   child: SizedBox(
      //     width: size.width * 0.8,
      //     // height: 40,
      //     child: ElevatedButton(
      //       style: ElevatedButton.styleFrom(
      //         shape: const StadiumBorder(),
      //         backgroundColor: secondaryColor,
      //       ),
      //       onPressed: !trainingController.workOutList[0].isComplete
      //           ? compareDateWithCurrent(
      //                       trainingController.selectedDate.value) ==
      //                   "Future"
      //               ? () {
      //                   customSnackBar(
      //                     context: context,
      //                     msg: 'Cannot complete up coming workout',
      //                     title: "Failed",
      //                     color: Colors.red,
      //                   );
      //                 }
      //               : () {
      //                   trainingController
      //                       .markComplete(trainingController.workOutList[0].id);
      //                 }
      //           : () {},
      //       child: trainingController.workOutList[0].isComplete
      //           ? const Text(
      //               "Completed",
      //               style: TextStyle(
      //                 fontFamily: "DMSans",
      //               ),
      //             )
      //           : Text(
      //               "Complete Workout",
      //               style: TextStyle(
      //                   fontSize: size.width * 0.038,
      //                   fontFamily: "DMSans",
      //                   color: Colors.black87),
      //             ),
      //     ),
      //   ),
      // ),
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
    required this.index,
    required this.coolDown,
  }) : super(key: key);

  final Size size;
  final String workout;
  final String title;
  final dynamic steps;
  final String instructions;
  final String metric, coolDown;
  final String video;
  final int index;
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
                color: primaryColor.withValues(alpha: 0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "$index. $title",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    isComplete
                        ? const Icon(
                            Icons.check_circle,
                            size: 22,
                            color: Colors.green,
                          )
                        : const CircleAvatar(
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
                  // Text(
                  //   title ?? 'Run + Squat + Burpee',
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .bodyMedium!
                  //       .copyWith(fontSize: 18, color: Colors.black),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  const SizedBox(height: 8),
                  //todo ---------------------> video
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
                        child: const CircleAvatar(
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
                  // ),
                  const SizedBox(height: 28),
                  if (steps != '') MyWidget1(steps: steps),
                  const SizedBox(height: 12),
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
                  const SizedBox(
                    height: 20,
                  ),
                  if (metric.isNotEmpty)
                    Row(
                      children: [
                        const Text(
                          "Metrics :-",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          " $metric",
                          style: const TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 5),
                  if (coolDown.isNotEmpty)
                    Row(
                      children: [
                        const Text(
                          "Cool Down :-",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            " $coolDown",
                            style: const TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(
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
          color: primaryColor.withValues(alpha: 0.04),
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
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                  bottomLeft: Radius.circular(isExpanded ? 0 : 10),
                  bottomRight: Radius.circular(isExpanded ? 0 : 10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
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
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
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
                      const SizedBox(
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
          color: primaryColor.withValues(alpha: 0.04),
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
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                  bottomLeft: Radius.circular(isExpanded ? 0 : 10),
                  bottomRight: Radius.circular(isExpanded ? 0 : 10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'STEPS',
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
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
                height: isExpanded ? null : 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
                  child: Text(
                    widget.steps,
                    style: Theme.of(context).textTheme.titleMedium,
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
