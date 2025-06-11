import 'package:sportperformance/extensions/context_extension.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final List<double> values;

  const MyBarGraph({super.key, required this.values});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BarChart(
      BarChartData(
        maxY: 100,
        minY: 0,
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(top: 2.8),
                  child: Text(
                    switch (value.toInt()) {
                      0 => context.translator.enero,
                      1 => context.translator.marzo,
                      2 => context.translator.mayo,
                      3 => context.translator.julio,
                      4 => context.translator.sept,
                      5 => context.translator.nov,
                      _ => "",
                    },
                    style: TextStyle(
                      fontSize: size.width * 0.032,
                    ),
                  ),
                );
              },
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        barGroups: values.indexed
            .map(
              (data) => BarChartGroupData(
                x: data.$1,
                barRods: [
                  BarChartRodData(
                    toY: data.$2,
                    color: Colors.blue.shade500,
                    width: 30,
                    borderRadius: BorderRadius.circular(1),
                    // borderSide: BorderSide(
                    //   color: darkMode.value ? Colors.white60 : Colors.black87
                    // )
                  ),
                ],
              ),
            )
            .toList(),
      ),
      curve: Curves.bounceInOut,
    );
  }
}

// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:sportperformance/extensions/context_extension.dart';
//
// class MyBarGraph extends StatelessWidget {
//   final List<double> values;
//
//   const MyBarGraph({super.key, required this.values});
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//
//     return Stack(
//       children: [
//         BarChart(
//           BarChartData(
//             maxY: 100,
//             minY: 0,
//             borderData: FlBorderData(show: false),
//             titlesData: FlTitlesData(
//               show: true,
//               topTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: false,
//                 ),
//               ),
//               bottomTitles: AxisTitles(
//                 sideTitles: SideTitles(
//                   showTitles: true,
//                   getTitlesWidget: (value, meta) {
//                     return Padding(
//                       padding: const EdgeInsets.only(top: 2.8),
//                       child: Text(
//                         switch (value.toInt()) {
//                           0 => context.translator.enero,
//                           1 => context.translator.marzo,
//                           2 => context.translator.mayo,
//                           3 => context.translator.julio,
//                           4 => context.translator.sept,
//                           5 => context.translator.nov,
//                           _ => "",
//                         },
//                         style: TextStyle(
//                           fontSize: size.width * 0.032,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               rightTitles: AxisTitles(
//                 sideTitles: SideTitles(showTitles: false),
//               ),
//             ),
//             barGroups: values.indexed
//                 .map(
//                   (data) => BarChartGroupData(
//                 x: data.$1,
//                 barRods: [
//                   BarChartRodData(
//
//                     toY: data.$2,
//                     color: Colors.blue.shade500,
//                     width: 30,
//                     borderRadius: BorderRadius.circular(1),
//                   ),
//                 ],
//               ),
//             )
//                 .toList(),
//           ),
//         ),
//         // Add text widgets to show values above each bar
//         ...values.indexed.map(
//               (data) {
//             final barWidth = 35.0; // width of the bars
//             final barHeight = data.$2;
//             return Positioned(
//               left: (data.$1 * (barWidth + 10)) + size.width * 0.192, // Adjust the position horizontally
//               bottom: barHeight + 10, // Adjust position vertically based on the bar's height
//               child: Text(
//                 data.$2.toStringAsFixed(0), // Displaying the value on top of the bar
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: size.width * 0.035,
//                 ),
//               ),
//             );
//           },
//         ).toList(),
//       ],
//     );
//   }
// }
