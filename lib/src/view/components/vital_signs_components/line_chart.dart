import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/utils/app_colors.dart';

class LineChartWidget extends StatefulWidget {
  List<ChartData>? chartData;
  LineChartWidget({Key? key, this.chartData}) : super(key: key);
  @override
  _LineDefaultState createState() => _LineDefaultState();
}

class _LineDefaultState extends State<LineChartWidget> {
  DateTime now = DateTime.now();
  List<double> values = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];

  @override
  void initState() {
    super.initState();

    if (widget.chartData == null) {
      widget.chartData = [];

      for (int i = 0; i < values.length; i++) {
        DateTime monthDate = DateTime(now.year, now.month - i, 1);
        String monthName = getMonthAbbreviation(monthDate.month);

        widget.chartData?.insert(0, ChartData(monthName, values[i]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          labelRotation: 45,
        ),
        primaryYAxis: NumericAxis(
          interval: 1,
          labelFormat: '{value}',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent),
        ),
        series: _getLineSeries(),
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  List<LineSeries<ChartData, String>> _getLineSeries() {
    return <LineSeries<ChartData, String>>[
      LineSeries<ChartData, String>(
        dataSource: widget.chartData,
        xValueMapper: (ChartData data, _) => data.time,
        yValueMapper: (ChartData data, _) => data.transaction,
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

class ChartData {
  ChartData(this.time, this.transaction);
  final String time;
  final double transaction;
}
