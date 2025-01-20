import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/utils/app_colors.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  _LineDefaultState createState() => _LineDefaultState();
}

class _LineDefaultState extends State<LineChartWidget> {
  List<_ChartData>? chartData;

  @override
  void initState() {
    super.initState();

    // Sample hourly transaction data (every 3 hours for a week)
    chartData = <_ChartData>[
      _ChartData('90', 90),
      _ChartData('95', 95),
      _ChartData('100', 100),
    ];
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
          labelFormat: '{value}',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent),
          isVisible: false, // Hides the Y-axis labels
        ),
        series: _getLineSeries(),
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  List<LineSeries<_ChartData, String>> _getLineSeries() {
    return <LineSeries<_ChartData, String>>[
      LineSeries<_ChartData, String>(
        dataSource: chartData!,
        xValueMapper: (_ChartData data, _) => data.time,
        yValueMapper: (_ChartData data, _) => data.transaction,
        name: 'Transaction',
        color: AppColors.primaryColor,
        markerSettings: const MarkerSettings(isVisible: true),
      ),
    ];
  }
}

class _ChartData {
  _ChartData(this.time, this.transaction);
  final String time; // Represents time in "Day HH:mm" format
  final double transaction; // Represents transaction amount
}
