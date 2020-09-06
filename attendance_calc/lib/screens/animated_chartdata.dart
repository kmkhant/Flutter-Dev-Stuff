import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class PercentageChart extends StatefulWidget {
  @override
  _PercentageChartState createState() => _PercentageChartState();
}

class _PercentageChartState extends State<PercentageChart> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();
  final _chartSize = const Size(160, 160);

  double value = 100;
  Color labelColor = Colors.green[200];

  void increment() {
    setState(() {
      if (value < 99) {
        value += 1;
      }
      List<CircularStackEntry> data = _generateChartData(value);
      _chartKey.currentState.updateData(data);
    });
  }

  void decrement() {
    setState(() {
      if (value > 1) {
        value--;
      }
      List<CircularStackEntry> data = _generateChartData(value);
      _chartKey.currentState.updateData(data);
    });
  }

  List<CircularStackEntry> _generateChartData(double value) {
    Color dialColor = Colors.green[200];
    if (value < 75) {
      dialColor = Colors.yellow[200];
    } else if (value < 50) {
      dialColor = Colors.red[200];
    }

    labelColor = dialColor;

    List<CircularStackEntry> data = <CircularStackEntry>[
      CircularStackEntry(<CircularSegmentEntry>[
        CircularSegmentEntry(
          value,
          dialColor,
          rankKey: 'percentage',
        )
      ], rankKey: 'percentage')
    ];

    return data;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _labelStyle = Theme.of(context)
        .textTheme
        .headline6
        .merge(new TextStyle(color: labelColor));
    return AnimatedCircularChart(
        key: _chartKey,
        size: _chartSize,
        initialChartData: _generateChartData(value),
        chartType: CircularChartType.Radial,
        edgeStyle: SegmentEdgeStyle.round,
        holeLabel: "$value%",
        labelStyle: _labelStyle);
  }
}
