import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/main.dart';
import 'package:sportperformance/utils/global.dart';

import '../controllers/home/body_composition_controller.dart';

class DatePart extends StatelessWidget {
  final compositionController = Get.put(BodyCompositionController());

  // final Map<String, double> dataMap = {
  //   'Masa Adiposa': 21,
  //   'Masa Muscular': 52,
  //   'Masa Residual': 11,
  //   'Masa Osea': 10,
  //   'Masa de la Piel': 5,
  // };

  final List<Color> colorList = [
    Colors.grey.shade400,
    Colors.grey,
    Colors.black,
    Colors.orange.shade300,
    Colors.grey.shade200,
  ];

  late List<Map<String, dynamic>> table1;
  // final List<Map<String, dynamic>> table1 = [
  //   {'title': 'E de 6 Pliegues', 'value': '5.7'},
  //   {'title': 'Indice Musculo - Oseo', 'value': '5.1'},
  // ];

  late List<Map<String, dynamic>> table2;
  // final List<Map<String, dynamic>> table2 = [
  //   {'title': 'kg de masa muscular', 'value': 'Aumentar 2 kg'},
  //   {'title': 'kgs de tejido adiposo', 'value': 'bajar 3 kg'},
  //   {'title': 'Masa corporal ideal (8 semanas)', 'value': '85'},
  // ];

  late List<Map<String, dynamic>> table3;

  //final List<Map<String, dynamic>> table3 = [
  //   {'title': 'Masa Adiposa', 'value': '21%', 'value2': '18.4'},
  //   {'title': 'Masa Muscular', 'value': '52%', 'value2': '44.9'},
  //   {'title': 'Masa Residual', 'value': '11%', 'value2': '9.8'},
  //   {'title': 'Masa Osea', 'value': '10%', 'value2': '8.8'},
  //   {'title': 'Masa dial Piel', 'value': '5%', 'value2': '4.0'},
  //   {'title': 'Masa Total', 'value': '100%', 'value2': '85.8'},
  // ];

  @override
  Widget build(BuildContext context) {
    table1 = [
      {'title': context.translator.sum_of_skin_folds},
      {'title': context.translator.muscle_bone_index},
    ];
    table2 = [
      {'title': context.translator.kg_of_muscle_mass},
      {'title': context.translator.kg_of_adipose_tissue},
      {'title': context.translator.ideal_body_mass_8_weeks},
    ];
    table3  = [
      {'title': context.translator.adipose_mass},
      {'title': context.translator.muscle_mass},
      {'title': context.translator.masa_residual},
      {'title': context.translator.masa_osea},
      {'title': context.translator.skin_mass},
      {'title': context.translator.total_body_mass},
    ];
    var size = MediaQuery.of(context).size;
    return Obx(() {
      return compositionController.isLoading.value
          ? myIndicator(context)
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //todo -----------------------------> pie chart
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: PieChart(
                      dataMap: compositionController.dataMap.value!,
                      chartLegendSpacing: 20,
                      chartRadius: size.width / 2,
                      colorList: colorList,
                      initialAngleInDegree: 0,
                      legendOptions: LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: true,
                        legendShape: BoxShape.rectangle,
                        legendTextStyle:
                        Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 11,
                        ),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: false,
                        showChartValues: true,
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: false,
                        chartValueStyle: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                        ),
                        decimalPlaces: 0,
                      ),
                    ),
                  ),
                  Gap(16),
                  //todo -----------------------------> first table
                  Table(
                    columnWidths: {0: FixedColumnWidth(size.width / 2)},
                    border: TableBorder.all(
                      color: darkMode.value ? Colors.white : Colors.black,
                    ),
                    children: List.generate(
                      table1.length,
                      (i) => TableRow(
                        children: [
                          TableCell(
                            child: MyTableCell(
                              table1[i]['title'],
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 10,
                                  ),
                            ),
                          ),
                          TableCell(
                            child: MyTableCell(
                                i == 0
                                    ? compositionController.piechart[0].the6Pliegues
                                    : compositionController.piechart[0].indiceMusculo,
                                // table1[i]['value'],
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 10,
                                    )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(16),
                  //todo ------------------------> Second section
                  Section(
                    title: context.translator.datePartTitle1, //"DatePart.title1",
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
                                    )),
                          ),
                          TableCell(
                            child: MyTableCell(
                                i == 0
                                    ? compositionController.piechart[0].muscularAmount
                                    : i == 1
                                        ? compositionController.piechart[0].adiposaAmount
                                        : compositionController.piechart[0].bodyWeight,
                                // table2[i]['value'],
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 10,
                                    )),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  //todo ------------------------> Third section
                  Section(
                    title: context.translator.studentTitle4, //"Student.title4",
                    child: Table(
                      columnWidths: {0: FixedColumnWidth(size.width / 2)},
                      border: TableBorder.all(
                        color: darkMode.value ? Colors.white : Colors.black,
                      ),
                      children: List.generate(table3.length, (i) {
                        // myLog("element type => ${compositionController
                        //     .piechart[0].runtimeType}");
                        return TableRow(
                          children: [
                            //todo ----------------> First column
                            TableCell(
                              child: MyTableCell(
                                table3[i]['title'],
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 10,
                                    ),
                              ),
                            ),
                            //todo ----------------> Second column
                            TableCell(
                              child: MyTableCell(
                                  i == 0
                                      ? compositionController
                                              .piechart[0].adiposaPercentage +
                                          '%'
                                      : i == 1
                                          ? compositionController.piechart[0]
                                                  .muscularPercentage +
                                              '%'
                                          : i == 2
                                              ? compositionController
                                                      .piechart[0]
                                                      .residualPercentage +
                                                  '%'
                                              : i == 3
                                                  ? compositionController
                                                          .piechart[0]
                                                          .oseaPercentage +
                                                      '%'
                                                  : i == 4
                                                      ? compositionController
                                                              .piechart[0]
                                                              .dialPielPercentage +
                                                          '%'
                                                      : "${(double.parse(compositionController.piechart[0].adiposaPercentage) + double.parse(compositionController.piechart[0].muscularPercentage) + double.parse(compositionController.piechart[0].residualPercentage) + double.parse(compositionController.piechart[0].oseaPercentage) + double.parse(compositionController.piechart[0].dialPielPercentage))}%",
                                  //  compositionController.piechart[0].bodyWeight
                                  // table4[i]['value'],
                                  Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 10),
                              ),
                            ),
                            //todo ----------------> Third column
                            TableCell(
                              child: MyTableCell(
                                  i == 0
                                      ? "${compositionController.piechart[0].adiposaKilogram} kg"
                                      : i == 1
                                          ? "${compositionController.piechart[0].muscularKilogram} kg"
                                          : i == 2
                                              ? "${compositionController.piechart[0].residualKilogram} kg"
                                              : i == 3
                                                  ? "${compositionController.piechart[0].oseaKilogram} kg"
                                                  : i == 4
                                                      ? "${compositionController.piechart[0].dialPielKilograms} kg"
                                                      : "${(double.parse(compositionController.piechart[0].adiposaKilogram) + double.parse(compositionController.piechart[0].muscularKilogram) + double.parse(compositionController.piechart[0].residualKilogram) + double.parse(compositionController.piechart[0].dialPielKilograms))} kg",
                                  // table4[i]['value2'],
                                  Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 10,
                                      )),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
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
    ////final translator = TranslatorGenerator.instance;

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
