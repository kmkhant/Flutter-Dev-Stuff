import 'package:attendance_calc/screens/animated_chartdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class ChartData extends ChangeNotifier {
  List<AnimatedCircularChart> _uiCharts = <AnimatedCircularChart>[
    AnimatedCircularChart(
      duration: Duration(seconds: 1),
      key: UniqueKey(),
      size: const Size(125, 125),
      initialChartData: <CircularStackEntry>[
        CircularStackEntry(
          <CircularSegmentEntry>[
            CircularSegmentEntry(20, Colors.red, rankKey: 'absence'),
            CircularSegmentEntry(80, Colors.green[300], rankKey: 'presence'),
          ],
          rankKey: 'Attendance',
        ),
      ],
      chartType: CircularChartType.Pie,
    ),
  ];

  get getUiCharts {
    return _uiCharts;
  }

  List<CircularStackEntry> generateData(double presence) {
    if (presence < 1) {
      presence = 0;
    } else if (presence > 100) {
      presence = 0;
    } else {}
  }

  void buildChart(double presence, double absence) {
    _uiCharts.add(AnimatedCircularChart(
      duration: Duration(seconds: 1),
      key: UniqueKey(),
      size: const Size(125, 125),
      initialChartData: <CircularStackEntry>[
        CircularStackEntry(
          <CircularSegmentEntry>[
            CircularSegmentEntry(absence, Colors.red, rankKey: 'absence'),
            CircularSegmentEntry(presence, Colors.green[300],
                rankKey: 'presence'),
          ],
          rankKey: 'Attendance',
        ),
      ],
      chartType: CircularChartType.Pie,
    ));
  }
}
