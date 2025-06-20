import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sportperformance/Components/MyLoading.dart';
import 'package:sportperformance/Components/MyNetworkError.dart';
import 'package:sportperformance/controllers/planning_programming_controller.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/extensions/object_extension.dart';
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
  List<String> availableDays = [];
  Map<String, List<ProgramDatumElement>> workoutsByDay = {};

  late List<Map<String, dynamic>> tabs;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        controller.getProgram();
      },
    );

    ever(controller.isProgramsLoading, (isLoading) {
      if (!isLoading && !controller.showError.value) {
        _loadWorkoutDays();
      }
    });
  }

  void _loadWorkoutDays() {
    if (controller.program.programData.isEmpty) return;

    workoutsByDay.clear();
    availableDays.clear();

    // Properly organize workouts by day
    controller.program.programData.forEach((dayKey, programElements) {
      workoutsByDay[dayKey] = (programElements as List)
          .map((e) => ProgramDatumElement.fromJson(e))
          .toList(); // or whatever type you need
      availableDays.add(dayKey);
    });

    availableDays.sort((a, b) => int.parse(a).compareTo(int.parse(b)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                  const Gap(16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.fitness_center,
                          color: Colors.blue[700],
                          size: 22,
                        ),
                      ),
                      const Gap(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.program.programName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                                height: 1.3,
                              ),
                            ),
                            const Gap(6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: controller.program.programComplete == "1"
                                    ? Colors.green.withValues(alpha: 0.1)
                                    : Colors.orange.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: controller.program.programComplete ==
                                          "1"
                                      ? Colors.green.withValues(alpha: 0.3)
                                      : Colors.orange.withValues(alpha: 0.3),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                controller.program.programComplete == "1"
                                    ? "Completed"
                                    : "Pending",
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      controller.program.programComplete == "1"
                                          ? Colors.green[700]
                                          : Colors.orange[700],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      controller.program.programDescription,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.6,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ],
              )),
          const Gap(20),

          // todo -----------------------> Day Tabs
          if (availableDays.isNotEmpty) ...[
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: availableDays.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedDayIndex == index;
                  final dayKey = availableDays[index];

                  return GestureDetector(
                    onTap: () => setState(() => selectedDayIndex = index),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      alignment: Alignment.center,
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
                      child: Column(
                        children: [
                          Text(
                            'Day $dayKey',
                            style: TextStyle(
                              color:
                                  isSelected ? Colors.white : Colors.grey[700],
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '${workoutsByDay[dayKey]!.length} Workout',
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white70
                                  : Colors.grey[500],
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Gap(5),
            _buildDayWorkouts(context, availableDays[selectedDayIndex]),
          ],
          const Gap(10),
        ],
      ),
    );
  }

  int _getTotalExercisesForDay(String dayKey) {
    final dayWorkouts = workoutsByDay[dayKey] ?? [];
    int totalExercises = 0;
    for (var workout in dayWorkouts) {
      totalExercises += workout.workoutDetails.length;
    }
    return totalExercises;
  }

  Widget _buildDayWorkouts(BuildContext context, String dayKey) {
    final dayWorkouts = workoutsByDay[dayKey] ?? [];
    return Column(
      children: dayWorkouts.asMap().entries.map((entry) {
        int workoutIndex = entry.key;
        ProgramDatumElement workout = entry.value;
        return Column(
          children: [
            _buildWorkoutHeader(context, workout, workoutIndex + 1),
            const Gap(16),
            _buildExercisesList(context, workout),
            if (workoutIndex < dayWorkouts.length - 1) const Gap(24),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildWorkoutHeader(
    BuildContext context,
    ProgramDatumElement workout,
    int workoutNumber,
  ) {
    return Column(
      spacing: 5,
      children: [
        const Divider(),
        Container(
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
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Workout $workoutNumber',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    workout.isComplete == "1" ? Icons.check_circle : null,
                    color: workout.isComplete == "1"
                        ? Colors.green.shade400
                        : Colors.white70,
                    size: 24,
                  ),
                ],
              ),
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
        ),
      ],
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
                child: (controller.program.exerciseVisible == "1")
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildExerciseDetailRow(
                            icon: Icons.fitness_center,
                            label: exercise.label,
                            title: exercise.title,
                            value: "Steps: ${exercise.steps}",
                          ),
                          const Gap(12),
                          ElevatedButton(
                            onPressed: () {
                              Utils.showMyDialog(
                                context,
                                YoutubeVideo(
                                  exercise.videoLink.isNotEmpty
                                      ? exercise.videoLink
                                      : "https://www.youtube.com/watch?v=fLLScgWQcHc",
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
                            "Status: ${isComplete ? "Completed" : "Pending"}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      )
                    : const Text(
                        "This exercise has been disabled by your coach.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ))
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
