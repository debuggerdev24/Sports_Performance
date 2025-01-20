import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/controllers/home/body_composition_controller.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';

import '../utils/global.dart';

class StudentsPart extends StatelessWidget {
  final compositionController = Get.put(BodyCompositionController());

  List<Map<String, dynamic>> table1 = [];

  List<Map<String, dynamic>> table2 = [];

// final List<Map<String, dynamic>> table2 = [
  List<Map<String, dynamic>> table3 = [];

  // final List<Map<String, dynamic>> table3 = [
  final List<Map<String, dynamic>> table4 = [
    {'title': 'Masa Adiposa', 'value': '21%', 'value2': '18.4'},
    {'title': 'Masa Muscular', 'value': '52%', 'value2': '44.9'},
    {'title': 'Masa Residual', 'value': '11%', 'value2': '9.8'},
    {'title': 'Masa Osea', 'value': '10%', 'value2': '8.8'},
    {'title': 'Masa dial Piel', 'value': '5%', 'value2': '4.0'},
    {'title': 'Masa Total', 'value': '100%', 'value2': '85.8'},
  ];

  @override
  Widget build(BuildContext context) {
    table1 = [
      {'title': context.translator.weight_kg},
      {'title': context.translator.height_cm},
    ];
    table2 = [
      {'title': context.translator.triceps},
      {'title': context.translator.subscapular},
      {'title': context.translator.supraespinal},
      {'title': context.translator.abdominal},
      {'title': context.translator.thigh},
      {'title': context.translator.biceps},

      {'title': context.translator.iiiac_crest},
      // {'title': context.translator.leg},
    ];
    table3 = [
      {'title': context.translator.head}, //Brazo Relajado
      {'title': context.translator.relaxed_arm},
      {'title': context.translator.contracted_arm}, //Antibrazo
      {'title': context.translator.forearm},
      {'title': context.translator.chest},
      {'title': context.translator.minimum_waist},
      {'title': context.translator.max_hip},
      {'title': context.translator.thigh_buttock},
      {'title': context.translator.medium_muscle},
      {'title': context.translator.leg},
    ];
    return Obx(() {
      if (compositionController.isLoading.value) {
        return myIndicator(context);
      } else {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //todo -----------------------> first table
              Section(
                title: context.translator.studentTitle1, //"Student.title1",
                child: Table(
                  border: TableBorder.all(
                    color: darkMode.value ? Colors.white : Colors.black,
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: List.generate(
                    table1.length,
                    (i) => TableRow(children: [
                      TableCell(
                        child: MyTableCell(
                            table1[i]['title'],
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontSize: 10,
                                )),
                      ),
                      TableCell(
                        child: MyTableCell(
                            i == 0
                                ? compositionController
                                .bodyComposition[0].weight
                                : compositionController
                                    .bodyComposition[0].height,
                            // table1[i]['value'],
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontSize: 10,
                                )),
                      ),
                    ]),
                  ),
                ),
              ),
              //todo -----------------------> second table
              Section(
                title: context.translator.studentTitle2, //"Student.title2",
                child: Table(
                  border: TableBorder.all(
                    color: darkMode.value ? Colors.white : Colors.black,
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: List.generate(
                    table2.length,
                    (i) => TableRow(children: [
                      TableCell(
                        child: MyTableCell(
                          table2[i]['title'],
                          Theme.of(context).textTheme.bodyLarge!.copyWith(
                                fontSize: 10,
                              ),
                        ),
                      ),
                      TableCell(
                        child: MyTableCell(
                            i == 0
                                ? compositionController
                                    .bodyComposition[0].triceps
                                : i == 1
                                    ? compositionController
                                        .bodyComposition[0].subscapularis
                                    : i == 2
                                        ? compositionController
                                            .bodyComposition[0].supraspinal
                                        : i == 3
                                            ? compositionController
                                                .bodyComposition[0].abdominal
                                            : i == 4
                                                ? compositionController
                                                    .bodyComposition[0].thigh
                                                : i == 5
                                                    ? compositionController
                                                        .bodyComposition[0]
                                                        .bceps
                                                    : i == 6
                                                        ? compositionController
                                                            .bodyComposition[0]
                                                            .iliacCrest
                                                        : compositionController
                                                            .bodyComposition[0]
                                                            .leg,
                            // table2[i]['value'],
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontSize: 10,
                                )),
                      ),
                    ]),
                  ),
                ),
              ),
              //todo -----------------------> third table
              Section(
                title: context.translator.studentTitle3, //"Student.title3",
                child: Table(
                  border: TableBorder.all(
                    color: darkMode.value ? Colors.white : Colors.black,
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: List.generate(
                    table3.length,
                    (i) => TableRow(children: [
                      TableCell(
                        child: MyTableCell(
                            table3[i]['title'],
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontSize: 10,
                                )),
                      ),
                      TableCell(
                        child: MyTableCell(
                            i == 0
                                ? compositionController.bodyComposition[0].head
                                : i == 1
                                    ? compositionController
                                        .bodyComposition[0].relaxedArm
                                    : i == 2
                                        ? compositionController
                                            .bodyComposition[0].contractedArm
                                        : i == 3
                                            ? compositionController
                                                .bodyComposition[0].forearm
                                            : i == 4
                                                ? compositionController
                                                    .bodyComposition[0].chest
                                                : i == 5
                                                    ? compositionController
                                                        .bodyComposition[0]
                                                        .minimumWaist
                                                    : i == 6
                                                        ? compositionController
                                                            .bodyComposition[0]
                                                            .maxHip
                                                        : i == 7
                                                            ? compositionController
                                                                .bodyComposition[
                                                                    0]
                                                                .thignButtock
                                                            : i == 8
                                                                ? compositionController
                                                                    .bodyComposition[
                                                                        0]
                                                                    .mediumMuscle
                                                                : compositionController
                                                                    .bodyComposition[
                                                                        0]
                                                                    .leg,
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontSize: 10,
                                )),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}

class Section extends StatelessWidget {
  final String title;
  final Widget child;

  const Section({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    //final translator = TranslatorGenerator.instance;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          collapsedIconColor: Theme.of(context).primaryColorLight,
          iconColor: Theme.of(context).primaryColorLight,
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 14,
                ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: child,
            )
          ],
        ),
      ),
    );
  }
}

class MyTableCell extends StatelessWidget {
  final String value;
  final TextStyle style;

  const MyTableCell(this.value, this.style);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
    );
  }
}
