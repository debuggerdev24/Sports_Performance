import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sportperformance/Utils/Color.dart';


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
    Size screenSize = MediaQuery.of(context).size;
    style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: screenSize.width * 0.03,
    );
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.50,
          child: LineChart(
            mainData(),
          ),
        ),
      ],
    );
  }

  //todo --------------> bottom titles
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Jan', style: style);
        break;
      case 1:
        text = Text('Feb', style: style);
        break;
      case 2:
        text = Text('Mar', style: style);
        break;
      case 3:
        text = Text('Apr', style: style);
        break;
      case 4:
        text = Text('May', style: style);
        break;
      case 5:
        text = Text('Jun', style: style);
        break;
      case 6:
        text = Text('Jul', style: style);
        break;
      case 7:
        text = Text('Aug', style: style);
        break;
      case 8:
        text = Text('Sep', style: style);
        break;
      case 9:
        text = Text('Oct', style: style);
        break;
      case 10:
        text = Text('Nov', style: style);
        break;
      case 11:
        text = Text('Dec', style: style);
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


  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        // horizontalInterval: 1,
        // verticalInterval: 1,
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
        border: Border.all(color: Colors.black38),
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
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withValues(alpha: 0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
