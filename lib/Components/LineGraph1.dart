// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportperformance/Models/timeLine_linegraph_model.dart';
import 'package:sportperformance/Utils/Color.dart';

import '../controllers/home/body_composition_controller.dart';

class LineChart1 extends StatefulWidget {
  List<FlSpot> data;
  LineChart1({super.key, required this.data});

  @override
  State<LineChart1> createState() => _LineChart1State();
}

class _LineChart1State extends State<LineChart1> {
  List<Color> gradientColors = [primaryColor, secondaryColor];

  bool showAvg = false;
  TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.50,
          child: LineChart(
            mainData(),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('JAN', style: style);
        break;
      case 1:
        text = Text('Feb', style: style);
        break;
      case 2:
        text = Text('MAR', style: style);
        break;
      case 3:
        text = Text('APR', style: style);
        break;
      case 4:
        text = Text('MAY', style: style);
        break;
      case 5:
        text = Text('JUN', style: style);
        break;
      case 6:
        text = Text('JUL', style: style);
        break;
      case 7:
        text = Text('AUG', style: style);
        break;
      case 8:
        text = Text('SEP', style: style);
        break;
      case 9:
        text = Text('OCT', style: style);
        break;
      case 10:
        text = Text('NOV', style: style);
        break;
      case 11:
        text = Text('DEC', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  List<FlSpot> generateChartData(LineGraphData data) {
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
    print(spots[1].y);
    return spots;
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        // getDrawingHorizontalLine: (value) {
        //   return FlLine(
        //     color: primaryColor,
        //     strokeWidth: 1,
        //   );
        // },
        // getDrawingVerticalLine: (value) {
        //   return FlLine(
        //     color: secondaryColor,
        //     strokeWidth: 1,
        //   );
        // },
      ),
      titlesData: FlTitlesData(
        // show: true,

        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          axisNameSize: 0,
          sideTitles: SideTitles(
            showTitles: true,
            interval: 5,
            // getTitlesWidget: leftTitleWidgets,
            reservedSize: 32,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Color(0xff37434d)),
      ),
      minX: 0,
      // maxX: 11,
      minY: 0,
      // maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: widget.data,
          // spots: generateChartData(widget.data),
          //  [
          //   FlSpot(0, 3),
          //   FlSpot(2.6, 2),
          //   FlSpot(4.9, 5),
          //   FlSpot(6.8, 3.1),
          //   FlSpot(8, 4),
          //   FlSpot(9.5, 3),
          //   FlSpot(11, 4),
          // ],
          isCurved: false,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          // belowBarData: BarAreaData(
          //   show: true,
          //   gradient: LinearGradient(
          //     colors: gradientColors
          //         .map((color) => color.withOpacity(0.3))
          //         .toList(),
          //   ),
          // ),
        ),
      ],
    );
  }
}
