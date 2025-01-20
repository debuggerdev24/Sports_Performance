import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Components/LineGraph1.dart';
import 'package:sportperformance/extensions/context_extension.dart';
import 'package:sportperformance/utils/global.dart';

import '../Models/timeLine_linegraph_model.dart';
import '../controllers/home/body_composition_controller.dart';

class GraphPart extends StatelessWidget {
  GraphPart({super.key});
  final compositionController = Get.put(BodyCompositionController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Obx(
      () {
        return compositionController.isLoading.value
            ? myIndicator(context)
            : compositionController.linegraph.isEmpty
                ? Text("No Data")
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(context.translator.skinFoldsGraph),
                        Gap(8),
                        LineChart1(
                            data: generateChartData1(
                                compositionController.linegraph[0])),
                        Gap(screenSize.height * 0.03),
                        Text(context.translator.boneMuscleIndexGraph),
                        Gap(8),
                        LineChart1(
                            data: generateChartData2(
                                compositionController.linegraph[0])),
                        Gap(screenSize.height * 0.03),
                        Text(context.translator.adiposeTissueGraph),
                        Gap(8),
                        LineChart1(
                            data: generateChartData3(
                                compositionController.linegraph[0])),
                        Gap(screenSize.height * 0.03),
                        Text(context.translator.muscularTissueGraph),
                        Gap(8),
                        LineChart1(
                            data: generateChartData4(
                                compositionController.linegraph[0])),
                      ],
                    ),
                  );
      },
    );
  }

  List<FlSpot> generateChartData1(LineGraphData data) {
    final List<FlSpot> spots = [];
    double januaryValue = double.tryParse(data.skinFoldsJanuary) ?? 0;
    double februaryValue = double.tryParse(data.skinFoldsFebruary) ?? 0;
    double marchValue = double.tryParse(data.skinFoldsMarch) ?? 0;
    double aprilValue = double.tryParse(data.skinFoldsApril) ?? 0;
    double MayValue = double.tryParse(data.skinFoldsMay) ?? 0;
    double JuneValue = double.tryParse(data.skinFoldsJune) ?? 0;
    double JulyValue = double.tryParse(data.skinFoldsJuly) ?? 0;
    double AugustValue = double.tryParse(data.skinFoldsAugust) ?? 0;
    double SeptemberValue = double.tryParse(data.skinFoldsSeptember) ?? 0;
    double OctoberValue = double.tryParse(data.skinFoldsOctober) ?? 0;
    double NovemberValue = double.tryParse(data.skinFoldsNovember) ?? 0;
    double DecemberValue = double.tryParse(data.skinFoldsDecember) ?? 0;
    spots.add(FlSpot(0, januaryValue));
    spots.add(FlSpot(1.toDouble(), februaryValue));
    spots.add(FlSpot(2.toDouble(), marchValue));
    spots.add(FlSpot(3.toDouble(), aprilValue));
    spots.add(FlSpot(4.toDouble(), MayValue));
    spots.add(FlSpot(5.toDouble(), JuneValue));
    spots.add(FlSpot(6.toDouble(), JulyValue));
    spots.add(FlSpot(7.toDouble(), AugustValue));
    spots.add(FlSpot(8.toDouble(), SeptemberValue));
    spots.add(FlSpot(9.toDouble(), OctoberValue));
    spots.add(FlSpot(10.toDouble(), NovemberValue));
    spots.add(FlSpot(11.toDouble(), DecemberValue));
    return spots;
  }

  List<FlSpot> generateChartData2(LineGraphData data) {
    final List<FlSpot> spots = [];
    double januaryValue = double.tryParse(data.boneMuscleJanuary) ?? 0;
    double februaryValue = double.tryParse(data.boneMuscleFebruary) ?? 0;
    double marchValue = double.tryParse(data.boneMuscleMarch) ?? 0;
    double aprilValue = double.tryParse(data.boneMuscleApril) ?? 0;
    double MayValue = double.tryParse(data.boneMuscleMay) ?? 0;
    double JuneValue = double.tryParse(data.boneMuscleJune) ?? 0;
    double JulyValue = double.tryParse(data.boneMuscleJuly) ?? 0;
    double AugustValue = double.tryParse(data.boneMuscleAugust) ?? 0;
    double SeptemberValue = double.tryParse(data.boneMuscleSeptember) ?? 0;
    double OctoberValue = double.tryParse(data.boneMuscleOctober) ?? 0;
    double NovemberValue = double.tryParse(data.boneMuscleNovember) ?? 0;
    double DecemberValue = double.tryParse(data.boneMuscleDecember) ?? 0;
    spots.add(FlSpot(0, januaryValue));
    spots.add(FlSpot(1.toDouble(), februaryValue));
    spots.add(FlSpot(2.toDouble(), marchValue));
    spots.add(FlSpot(3.toDouble(), aprilValue));
    spots.add(FlSpot(4.toDouble(), MayValue));
    spots.add(FlSpot(5.toDouble(), JuneValue));
    spots.add(FlSpot(6.toDouble(), JulyValue));
    spots.add(FlSpot(7.toDouble(), AugustValue));
    spots.add(FlSpot(8.toDouble(), SeptemberValue));
    spots.add(FlSpot(9.toDouble(), OctoberValue));
    spots.add(FlSpot(10.toDouble(), NovemberValue));
    spots.add(FlSpot(11.toDouble(), DecemberValue));
    return spots;
  }


  List<FlSpot> generateChartData3(LineGraphData data) {
    final List<FlSpot> spots = [];
    double januaryValue = double.tryParse(data.adiposeTissueJanuary) ?? 0;
    double februaryValue = double.tryParse(data.adiposeTissueFebruary) ?? 0;
    double marchValue = double.tryParse(data.adiposeTissueMarch) ?? 0;
    double aprilValue = double.tryParse(data.adiposeTissueApril) ?? 0;
    double MayValue = double.tryParse(data.adiposeTissueMay) ?? 0;
    double JuneValue = double.tryParse(data.adiposeTissueJune) ?? 0;
    double JulyValue = double.tryParse(data.adiposeTissueJuly) ?? 0;
    double AugustValue = double.tryParse(data.adiposeTissueAugust) ?? 0;
    double SeptemberValue = double.tryParse(data.adiposeTissueSeptember) ?? 0;
    double OctoberValue = double.tryParse(data.adiposeTissueOctober) ?? 0;
    double NovemberValue = double.tryParse(data.adiposeTissueNovember) ?? 0;
    double DecemberValue = double.tryParse(data.adiposeTissueDecember) ?? 0;
    spots.add(FlSpot(0, januaryValue));
    spots.add(FlSpot(1.toDouble(), februaryValue));
    spots.add(FlSpot(2.toDouble(), marchValue));
    spots.add(FlSpot(3.toDouble(), aprilValue));
    spots.add(FlSpot(4.toDouble(), MayValue));
    spots.add(FlSpot(5.toDouble(), JuneValue));
    spots.add(FlSpot(6.toDouble(), JulyValue));
    spots.add(FlSpot(7.toDouble(), AugustValue));
    spots.add(FlSpot(8.toDouble(), SeptemberValue));
    spots.add(FlSpot(9.toDouble(), OctoberValue));
    spots.add(FlSpot(10.toDouble(), NovemberValue));
    spots.add(FlSpot(11.toDouble(), DecemberValue));
    return spots;
  }

  List<FlSpot> generateChartData4(LineGraphData data) {
    final List<FlSpot> spots = [];
    double januaryValue = double.tryParse(data.muscularTissueJanuary) ?? 0;
    double februaryValue = double.tryParse(data.muscularTissueFebruary) ?? 0;
    double marchValue = double.tryParse(data.muscularTissueMarch) ?? 0;
    double aprilValue = double.tryParse(data.muscularTissueApril) ?? 0;
    double MayValue = double.tryParse(data.muscularTissueMay) ?? 0;
    double JuneValue = double.tryParse(data.muscularTissueJune) ?? 0;
    double JulyValue = double.tryParse(data.muscularTissueJuly) ?? 0;
    double AugustValue = double.tryParse(data.muscularTissueAugust) ?? 0;
    double SeptemberValue = double.tryParse(data.muscularTissueSeptember) ?? 0;
    double OctoberValue = double.tryParse(data.muscularTissueOctober) ?? 0;
    double NovemberValue = double.tryParse(data.muscularTissueNovember) ?? 0;
    double DecemberValue = double.tryParse(data.muscularTissueDecember) ?? 0;
    spots.add(FlSpot(0, januaryValue));
    spots.add(FlSpot(1.toDouble(), februaryValue));
    spots.add(FlSpot(2.toDouble(), marchValue));
    spots.add(FlSpot(3.toDouble(), aprilValue));
    spots.add(FlSpot(4.toDouble(), MayValue));
    spots.add(FlSpot(5.toDouble(), JuneValue));
    spots.add(FlSpot(6.toDouble(), JulyValue));
    spots.add(FlSpot(7.toDouble(), AugustValue));
    spots.add(FlSpot(8.toDouble(), SeptemberValue));
    spots.add(FlSpot(9.toDouble(), OctoberValue));
    spots.add(FlSpot(10.toDouble(), NovemberValue));
    spots.add(FlSpot(11.toDouble(), DecemberValue));
    return spots;
  }

}
