import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/utils/app_colors.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  _LineDefaultState createState() => _LineDefaultState();
}

class _LineDefaultState extends State<LineChartWidget> {
  DateTime now = DateTime.now();
  late List<_ChartData> chartData; // Initialize chartData properly
  List<double> values = [22.5, 22.3, 21.0, 21.7, 21.5, 21.8];

  @override
  void initState() {
    super.initState();
    chartData = []; // Properly initialize the list

    for (int i = 0; i < values.length; i++) {
      DateTime monthDate = DateTime(now.year, now.month - i, 1);
      String monthName = getMonthAbbreviation(monthDate.month);

      chartData.insert(0, _ChartData(monthName, values[i])); // Insert values
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          labelRotation: 45, // Set the label rotation angle
        ),
        primaryYAxis: NumericAxis(
          minimum: 18, // Set the minimum value of BMI
          maximum: 25, // Set the maximum value of BMI
          interval: 1, // Interval between BMI values
          labelFormat: '{value}', // Format the Y-axis labels
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent),
        ),
        series: _getLineSeries(),
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  List<LineSeries<_ChartData, String>> _getLineSeries() {
    return <LineSeries<_ChartData, String>>[
      LineSeries<_ChartData, String>(
        dataSource: chartData,
        xValueMapper: (_ChartData data, _) => data.time,
        yValueMapper: (_ChartData data, _) => data.transaction,
        name: 'BMI',
        color: AppColors.primaryColor,
        markerSettings: const MarkerSettings(isVisible: true),
      ),
    ];
  }
}

String getMonthAbbreviation(int month) {
  List<String> monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  return monthNames[month - 1];
}

class _ChartData {
  _ChartData(this.time, this.transaction);
  final String time; // Represents the month (e.g., Jan, Feb)
  final double transaction; // Represents BMI value for the month
}
