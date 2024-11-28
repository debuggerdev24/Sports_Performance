import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/MyCell.dart';
import 'package:flutter_translator/flutter_translator.dart';
import 'package:sportperformance/controllers/home/body_composition_controller.dart';
import 'package:sportperformance/main.dart';

class OldDataStudentsPart extends StatelessWidget {
  final compositionController = Get.put(BodyCompositionController());
  final List<Map<String, dynamic>> table1 = [
    {'title': 'Peso Kg', 'value': '85.8'},
    {'title': 'Talla cm', 'value': '190'},
  ];

  final List<Map<String, dynamic>> table2 = [
    {'title': 'Triceps', 'value': '6'},
    {'title': 'Sabescapular', 'value': '8'},
    {'title': 'Supraespinal', 'value': '10'},
    {'title': 'Abdominal', 'value': '19'},
    {'title': 'Moslo(medial)', 'value': '8'},
    {'title': 'Pantorilla', 'value': '6'},
  ];

  final List<Map<String, dynamic>> table3 = [
    {'title': 'Brazo Relajado', 'value': '36.4'},
    {'title': 'Brazo Flexionado en Tension', 'value': '37.7'},
    {'title': 'Antibrazo (maximo)', 'value': '30.3'},
    {'title': 'Torax Mesoestirnal', 'value': '105.5'},
    {'title': 'Centora(meinima)', 'value': '86'},
    {'title': 'Cadiras(maxima)', 'value': '101.5'},
    {'title': 'Moslo(superior)', 'value': '61'},
    {'title': 'Moslo(medio)', 'value': '57'},
    {'title': 'Pantorilla(maxima)', 'value': '38.6'},
  ];

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
    var size = MediaQuery.of(context).size;
    return Obx(() {
      print(compositionController.bodyComposition.length);
      return compositionController.isLoading.value
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
              children: compositionController.bodyComposition
                  .where((p0) =>
                      compositionController.bodyComposition.indexOf(p0) > 0)
                  .map((data) => Section(
                        title: "BodyCompo.option5",
                        titleNo: compositionController.bodyComposition
                            .indexOf(data)
                            .toString(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Section(
                              title: "Student.title1",
                              child: Table(
                                border: TableBorder.all(
                                  color: darkMode.value
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: List.generate(
                                  table1.length,
                                  (i) => TableRow(children: [
                                    TableCell(
                                      child: MyTableCell(
                                          table1[i]['title'],
                                          Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 10,
                                              )),
                                    ),
                                    TableCell(
                                      child: MyTableCell(
                                          i == 0 ? data.weight : data.height,
                                          // table1[i]['value'],
                                          Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 10,
                                              )),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                            Section(
                              title: "Student.title2",
                              child: Table(
                                border: TableBorder.all(
                                  color: darkMode.value
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: List.generate(
                                  table2.length,
                                  (i) => TableRow(children: [
                                    TableCell(
                                      child: MyTableCell(
                                          table2[i]['title'],
                                          Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 10,
                                              )),
                                    ),
                                    TableCell(
                                      child: MyTableCell(
                                          i == 0
                                              ? data.triceps
                                              : i == 1
                                                  ? data.subscapularis
                                                  : i == 2
                                                      ? data.supraspinal
                                                      : i == 3
                                                          ? data.abdominal
                                                          : i == 4
                                                              ? data.leg
                                                              : data.thigh,
                                          // table2[i]['value'],
                                          Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 10,
                                              )),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                            Section(
                              title: "Student.title3",
                              child: Table(
                                border: TableBorder.all(
                                  color: darkMode.value
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                children: List.generate(
                                  table3.length,
                                  (i) => TableRow(children: [
                                    TableCell(
                                      child: MyTableCell(
                                          table3[i]['title'],
                                          Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 10,
                                              )),
                                    ),
                                    TableCell(
                                      child: MyTableCell(
                                          i == 0
                                              ? data.relaxedArm
                                              : table3[i]['value'],
                                          // table3[i]['value'],
                                          Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize: 10,
                                              )),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ));
    });
  }
}

class Section extends StatelessWidget {
  final String title;
  final String titleNo;
  final Widget child;

  const Section({required this.title, required this.child, this.titleNo = ''});
  @override
  Widget build(BuildContext context) {
    final translator = TranslatorGenerator.instance;
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
            "${translator.getString(title)} $titleNo",
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
