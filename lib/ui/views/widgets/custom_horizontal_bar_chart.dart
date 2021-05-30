
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CustomHorizontalBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  CustomHorizontalBarChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {

    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      animationDuration: Duration(seconds: 3),
      vertical: false,
    );
  }


}

