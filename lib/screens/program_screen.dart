import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportperformance/Components/MyLoading.dart';
import 'package:sportperformance/Components/MyNetworkError.dart';
import 'package:sportperformance/controllers/planning_programming_controller.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/utils/global.dart';

import '../components/YoutubeVideo.dart';
import '../models/program_model.dart';
import '../utils/utils.dart';

class ProgramListScreen extends StatefulWidget {
  @override
  State<ProgramListScreen> createState() => _ProgramListScreenState();
}

class _ProgramListScreenState extends State<ProgramListScreen> {
  final controller = Get.put(PlanningProgrammingController());
  int selectedDayIndex = 0;
  List<ProgramDatumElement> workoutDays = [];

  late List<Map<String, dynamic>> tabs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        controller.getProgram();
      },
    );
    // Listen for changes in program data and reload workout days
    ever(controller.isProgramsLoading, (isLoading) {
      if (!isLoading && !controller.showError.value) {
        _loadWorkoutDays();
      }
    });
  }

  void _loadWorkoutDays() {
    if (controller.program.programData.isEmpty) return;

    workoutDays.clear();
    controller.program.programData.forEach((key, value) {
      if (value is List) {
        for (var item in value) {
          workoutDays.add(ProgramDatumElement.fromJson(item));
        }
      } else if (value is Map) {
        value.forEach((subKey, subValue) {
          if (subValue is Map<String, dynamic>) {
            workoutDays.add(ProgramDatumElement.fromJson(subValue));
          }
        });
      }
    });
    workoutDays.sort((a, b) => int.parse(a.day).compareTo(int.parse(b.day)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _txtCusAddress = TextEditingController();
    tabs = [
      {"title": context.translator.mainTab1, "icon": "assets/images/home.png"},
      {
        "title": context.translator.mainTab3,
        "icon": "assets/images/settings.png"
      },
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyAppBar(),
                    const Gap(10),
                    Text(
                      context.translator.planItem2,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Gap(size.height * 0.018),

                    // Enhanced Expanded Widget with Workout Program UI
                    Expanded(
                      child: Obx(() {
                        return controller.isProgramsLoading.value
                            ? const MyLoading()
                            : controller.showError.value
                                ? const MyNetworkError()
                                : _buildWorkoutProgramUI(context, size);
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: MyBottomNavBar(tabs: tabs));
  }

  Widget _buildWorkoutProgramUI(BuildContext context, Size size) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.fitness_center,
                      color: Colors.black,
                      size: 24,
                    ),
                    const Gap(12),
                    Expanded(
                      child: Text(
                        controller.program.programName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(14),
                Text(
                  controller.program.programDescription,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       _buildInfoChip(
                //         context: context,
                //         icon: Icons.calendar_today,
                //         label: '${workoutDays.length} Days',
                //         color: Colors.green,
                //       ),
                //       // const Gap(12),
                //       // _buildInfoChip(
                //       //   context: context,
                //       //   icon: Icons.timer,
                //       //   label: '3x Semana',
                //       //   color: Colors.orange,
                //       // ),
                //       // const Gap(12),
                //       // _buildInfoChip(
                //       //   context: context,
                //       //   icon: Icons.trending_up,
                //       //   label: 'Intermedio',
                //       //   color: Colors.purple,
                //       // ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          const Gap(20),
          if (workoutDays.isNotEmpty) ...[
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: workoutDays.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedDayIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedDayIndex = index),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : Colors.grey[300]!,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withValues(alpha: 0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          'Day ${workoutDays[index].day}',
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey[700],
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Gap(20),
            _buildWorkoutHeader(context, workoutDays[selectedDayIndex]),
            const Gap(16),
            _buildExercisesList(context, workoutDays[selectedDayIndex]),
          ],
          const Gap(10),
        ],
      ),
    );
  }

  Widget _buildInfoChip({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const Gap(4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutHeader(
    BuildContext context,
    ProgramDatumElement workout,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.black.withValues(alpha: 0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(12),
          Text(
            workout.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(8),
          Text(
            '${workout.workoutDetails.length} Exercises',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExercisesList(
      BuildContext context, ProgramDatumElement workout) {
    return Column(
      children: workout.workoutDetails.asMap().entries.map((entry) {
        int index = entry.key;
        WorkoutDetail exercise = entry.value;
        bool isComplete = workout.isComplete == "1" ? true : false;
        return _buildExerciseCard(context, exercise, index + 1, isComplete);
      }).toList(),
    );
  }

  Widget _buildExerciseCard(BuildContext context, WorkoutDetail exercise,
      int exerciseNumber, bool isComplete) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                exerciseNumber.toString(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          title: Text(
            exercise.title.trim(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          // subtitle: Text(
          //   _formatExerciseSteps(exercise.steps),
          //   style: TextStyle(
          //     color: Colors.grey[600],
          //     fontSize: 12,
          //   ),
          // ),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildExerciseDetailRow(
                    icon: Icons.fitness_center,
                    label: exercise.label,
                    title: exercise.title,
                    value: "Steps : ${exercise.steps}",
                  ),
                  const Gap(12),
                  ElevatedButton(
                    onPressed: () {
                      Utils.showMyDialog(
                        context,
                        const YoutubeVideo(
                          "https://www.youtube.com/watch?v=fLLScgWQcHc",
                          true,
                        ),
                        padding: EdgeInsets.zero,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Play Video',
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(Icons.play_arrow_rounded)
                      ],
                    ),
                  ),
                  const Gap(5),
                  Text(
                    "Status : ${isComplete ? "Completed" : "Pending"}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseDetailRow({
    required IconData icon,
    required String label,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const Gap(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              const Gap(4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatExerciseSteps(String steps) {
    // Clean up the steps text for subtitle display
    return steps.replaceAll(' / ', ' • ').trim();
  }
}

// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:sportperformance/Components/MyLoading.dart';
// import 'package:sportperformance/Components/MyNetworkError.dart';
// import 'package:sportperformance/controllers/planning_programming_controller.dart';
// import 'package:sportperformance/extensions/context_extension.dart';
// import 'package:sportperformance/utils/global.dart';
//
//
// class ProgramListScreen extends StatefulWidget {
//   @override
//   State<ProgramListScreen> createState() => _ProgramListScreenState();
// }
//
// class _ProgramListScreenState extends State<ProgramListScreen> {
//   final controller = Get.put(PlanningProgrammingController());
//   //final translator = TranslatorGenerator.instance;
//
//   late List<Map<String, dynamic>> tabs;
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _txtCusAddress = TextEditingController();
//     tabs = [
//       {"title": context.translator.mainTab1, "icon": "assets/images/home.png"},
//       // {"title": "Main.tab2", "icon": "assets/images/dumble.png"},
//       {
//         "title": context.translator.mainTab3,
//         "icon": "assets/images/settings.png"
//       },
//       // {
//       //   "title": context.translator.mainTab2,
//       //   "icon": "assets/images/dumble.png"
//       // },
//       {
//         "title": context.translator.mainTab4,
//         "icon": "assets/images/profile.png"
//       },
//     ];
//     var size = MediaQuery.of(context).size;
//     // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//     //   statusBarColor: Colors.transparent,
//     //   statusBarIconBrightness: Brightness.dark,
//     // ));
//     return Scaffold(
//         body: Stack(
//           children: [
//             backgroundImage(context),
//             SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const MyAppBar(),
//                     const Gap(10),
//                     Text(
//                       context.translator.planItem2,
//                       // translator.getString("PlanList.title"),
//                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                           ),
//                     ),
//                     Gap(size.height * 0.018),
//                     // GooglePlaceAutoCompleteTextField(
//                     //   isCrossBtnShown: false,
//                     //   textEditingController: _txtCusAddress,
//                     //   googleAPIKey: 'AIzaSyDVd-7a3rcvyfeCqNH0zojzZx6FQsOpyD0',
//                     //   inputDecoration: const InputDecoration(
//                     //     border: OutlineInputBorder(),
//                     //   ),
//                     //   debounceTime: 800,
//                     //   isLatLngRequired: true,
//                     //   getPlaceDetailWithLatLng: (prediction) {},
//                     //   itemClick: (prediction) {
//                     //     _txtCusAddress.text = prediction.description!;
//                     //     _txtCusAddress.selection = TextSelection.fromPosition(
//                     //       TextPosition(offset: prediction.description!.length),
//                     //     );
//                     //   },
//                     // ),
//                     Expanded(
//                       child: Obx(() {
//                         return controller.isProgramsLoading.value
//                             ? const MyLoading()
//                             : controller.showError.value
//                                 ? const MyNetworkError()
//                                 : SingleChildScrollView(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           controller.program.programName,
//                                           // translator.getString("PlanList.title"),
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodyLarge!
//                                               .copyWith(
//                                                 fontSize: 20,
//                                                 fontWeight: FontWeight.w600,
//                                               ),
//                                         ),
//                                         Gap(size.height * 0.018),
//                                       ],
//                                     ),
//                                   );
//                       }),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: MyBottomNavBar(tabs: tabs));
//   }
// }
// // BottomNavigationBar(
// //         elevation: 0,
// //         iconSize: 30,
// //         selectedFontSize: 10,
// //         unselectedFontSize: 10,
// //         showUnselectedLabels: true,
// //         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
// //         selectedItemColor: Theme.of(context).primaryColorLight,
// //         unselectedItemColor: Colors.grey,
// //         onTap: (page) => Get.offAll(MainScreen(page)),//todo Navigator.of(context).pop(page),
// //         items: List.generate(
// //           tabs.length,
// //           (index) => BottomNavigationBarItem(
// //             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
// //             icon: ImageIcon(AssetImage(tabs[index]['icon'])),
// //             label: tabs[index]['title'],
// //           ),
// //         ),
// //       ),
