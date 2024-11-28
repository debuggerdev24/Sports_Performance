import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:sportperformance/Components/MyLoading.dart';
import 'package:sportperformance/Components/MyNetworkError.dart';
import 'package:sportperformance/apiServices/nutrition_services.dart';
import 'package:sportperformance/controllers/nutrition_screen_controller.dart';
import 'package:sportperformance/snackbar.dart';
import '../Utils/Color.dart';

class NutritionScreen extends StatefulWidget {
  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  bool isDownloading = false;
  DateTime _selectedDate = DateTime.now();
  final controller = Get.put(NutritionScreenController());

  void _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      setState(() {});
      final weekday = DateFormat('EEEE').format(pickedDate).toLowerCase();
      controller.getNutritions(weekday);
    }
  }

  String _getFormattedDate(DateTime date) {
    final bool isToday = date.day == DateTime.now().day &&
        date.month == DateTime.now().month &&
        date.year == DateTime.now().year;

    if (isToday) {
      return 'Today, ${DateFormat('MMMM d').format(date)}';
    } else {
      return DateFormat('MMMM d').format(date);
    }
  }

  void _downloadDocument() async {
    isDownloading = true;
    setState(() {});
    await NutritionServices()
        .downloadFile(controller.nutritions!.nutritionDoc!, context)
        .then((value) async {
      isDownloading = false;
      setState(() {});
      snackbar(
        context: context,
        msg: "File saved to $value",
        title: 'Success',
      );
      if (value != "Error") {
        await OpenFile.open(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: primaryColor.withOpacity(0.1),
      appBar: AppBar(
        title: Text('Nutrtion'),
      ),
      body: Obx(() {
        return Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _getFormattedDate(_selectedDate),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      InkWell(
                        onTap: () => _showDatePicker(context),
                        child: Row(
                          children: [
                            Icon(
                              Icons.history,
                              color: primaryColor,
                            ),
                            Text(
                              'View History',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: primaryColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  controller.isLoading.value
                      ? const Padding(
                          padding: EdgeInsets.only(top: 60),
                          child: MyLoading(),
                        )
                      : controller.showError.value
                          ? const Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: MyNetworkError(),
                            )
                          : Container(
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
                                  border: Border.all(
                                      color: primaryColor, width: 0.5)),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: primaryColor.withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Micronutrient',
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            'Goal',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(color: Colors.black),
                                          ),
                                          SizedBox(width: 30),
                                          Text(
                                            'Actual',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Nutrient(goal: controller.nutritions!.carbs),
                                  Nutrient(
                                    color: Colors.yellow.withOpacity(0.6),
                                    nutrient: 'Protien (g)',
                                    goal: controller.nutritions!.protein,
                                  ),
                                  Nutrient(
                                    color: Colors.red.shade200,
                                    nutrient: 'Fiber (g)',
                                    goal: controller.nutritions!.fiber,
                                  ),
                                  Nutrient(
                                    color: Colors.teal.shade200,
                                    nutrient: 'Fat (g)',
                                    goal: controller.nutritions!.fat,
                                  ),
                                  Nutrient(
                                    color: Colors.green.shade200,
                                    nutrient: 'Calories',
                                    goal: controller.totalNutirient
                                        .toStringAsFixed(0),
                                  ),
                                ],
                              ),
                            ),
                  if (controller.isLoading.value == false)
                    const SizedBox(height: 20),
                  if (controller.isLoading.value == false)
                    Container(
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
                        border: Border.all(color: primaryColor, width: 0.5),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18.0),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.2),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              'DOCS',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.teal,
                              child: Icon(
                                Icons.assignment_outlined,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            title: Text(
                              controller.nutritions!.nutritionDoc!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                            ),
                            trailing: InkWell(
                              onTap: _downloadDocument,
                              child: const Icon(
                                Icons.download,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            if (isDownloading) const MyLoading(),
          ],
        );
      }),
    );
  }
}

class Nutrient extends StatelessWidget {
  final Color? color;
  final String? nutrient, goal;
  const Nutrient({
    this.color,
    this.goal,
    this.nutrient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.4, color: primaryColor)),
      ),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: color ?? Colors.purple.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5)),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            nutrient ?? 'Carbs (g)',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          Spacer(),
          Text(
            goal ?? '1',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
          ),
          SizedBox(
            width: 70,
          ),
          Text(
            '--',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
