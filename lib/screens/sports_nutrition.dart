import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:sportperformance/Components/MyLoading.dart';
import 'package:sportperformance/Components/MyNetworkError.dart';
import 'package:sportperformance/apiServices/nutrition_services.dart';
import 'package:sportperformance/controllers/nutrition_screen_controller.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/extensions/object_extension.dart';
import 'package:sportperformance/snackbar.dart';
import 'package:sportperformance/utils/global.dart';
import 'package:sportperformance/utils/url.dart';
import '../Utils/color.dart';
import 'package:sportperformance/utils/global.dart';

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

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // controller.getNutritions();
  //
  //   _showDatePicker(context);
  //   super.initState();
  // }

  void downloadDocument() async {
    if (controller.nutritions!.nutritionDoc == null) return
    myLog("Doc name : ${controller.nutritions!.nutritionDoc}");
    isDownloading = true;
    setState(() {});
    String fileName = controller.nutritions!.nutritionDoc!;
    await NutritionServices().downloadFile(mainUrl + nutritionDocUrl + fileName,fileName, context)
        .then((value) async {
      isDownloading = false;
      setState(() {});
      if (value != "Error") {
        snackbar(
          context: context,
          msg: "File Saved Successfully",
          title: 'Success',
        );
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
        title: Text(context.translator.homeItem2),
      ),
      body: Obx(() {
        final nutrition = controller.nutritions;
        return Stack(
          children: [
            backgroundImage(context),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(11, 5, 11, 0),
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
                  Gap(size.height * 0.04),
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
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 10,
                                        color: primaryColor
                                            .withAlpha((0.22 * 255).toInt()),
                                        //primaryColor.withOpacity(0.2),
                                        spreadRadius: 2)
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: primaryColor, width: 0.5)),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: primaryColor
                                          .withAlpha((0.25 * 255).toInt()),
                                      //primaryColor.withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 14),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            context.translator.macronutrients,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: size.width * 0.0395,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Spacer(),
                                          Text(
                                            context.translator.dailyIntake,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: size.width * 0.0395,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Gap(size.width * 0.07),
                                          Text(
                                            context.translator.percentage,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: size.width * 0.0395,
                                                fontWeight: FontWeight.bold),
                                            // Theme.of(context)
                                            //     .textTheme
                                            //     .bodyMedium!
                                            //     .copyWith(color: Colors.black),
                                          ),
                                          Gap(4),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Nutrient(
                                    goal: nutrition!.carbs!,
                                    nutrient: 'Carbs (g)',
                                    actual:
                                        ((int.parse(nutrition.carbs!) * 400) /
                                            679),
                                  ),
                                  //todo -------> change 1 : controller.nutritions!.carbs
                                  Nutrient(
                                    color: Colors.yellow,
                                    //.withOpacity(0.6),
                                    nutrient: "${context.translator.protein} (g)",
                                    goal: nutrition.protein!,
                                    //todo -------> change 2 : controller.nutritions!.protein
                                    actual:
                                        ((int.parse(nutrition.protein!) * 400) /
                                            679),
                                  ),
                                  // Nutrient(
                                  //   color: Colors.red.shade200,
                                  //   nutrient: "Fiber (g)",
                                  //   actual: "",
                                  //   goal: nutrition
                                  //       .fiber!, //todo -------> change 3 : controller.nutritions!.fiber,
                                  // ),
                                  Nutrient(
                                    color: Colors.teal.shade200,
                                    nutrient: "${context.translator.fat} (g)",
                                    goal: nutrition.fat!,
                                    //todo -------> change 4 : controller.nutritions!.fat,
                                    actual: ((int.parse(nutrition.fat!) * 900) /
                                        679),
                                  ),
                                  Nutrient(
                                    color: Colors.green.shade200,
                                    nutrient: context.translator.calories,
                                    goal: controller.totalNutirient
                                        .toStringAsFixed(0),
                                    //todo -------> change 5 : controller.totalNutirient.toStringAsFixed(0),
                                    actual: ((int.parse(nutrition.carbs!) *
                                                400) /
                                            679) +
                                        ((int.parse(nutrition.protein!) * 400) /
                                            679) +
                                        ((int.parse(nutrition.fat!) * 900) /
                                            679),
                                  ),
                                ],
                              ),
                            ),
                  Gap(size.height * 0.03),
                  if (controller.isLoading.value == false)
                    Container(
                      width: size.width,
                      // height: size.height * 0.23,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color:
                                  primaryColor.withAlpha((0.22 * 255).toInt()),
                              //primaryColor.withOpacity(0.2),
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
                              color: primaryColor.withAlpha((0.25 * 255).toInt()),
                              //primaryColor.withOpacity(0.2),
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
                              //todo -------> change 5 : controller.nutritions!.nutritionDoc!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                            ),
                            trailing: InkWell(
                              onTap: downloadDocument,
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
  final String nutrient, goal;
  dynamic actual;

  Nutrient({
    this.color,
    required this.goal,
    required this.nutrient,
    this.actual,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      // margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.4, color: primaryColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Gap(5),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: color ?? Colors.purple.withAlpha(160),
                //.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5)),
          ),
          Gap(10),
          Text(
            nutrient,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          Spacer(),
          Text(
            goal,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Gap(width * 0.14),
          Text(
            " ${(actual as double).toStringAsFixed((nutrient == "Calories") ? 0 : 2)}%",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Gap(15),
        ],
      ),
    );
  }
}
