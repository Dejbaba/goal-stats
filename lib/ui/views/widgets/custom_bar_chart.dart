import 'package:bots_assessment/core/models/goal_stat.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomBarChart extends StatefulWidget {

  final List<GoalStat> goalStats;
  CustomBarChart({Key key, this.goalStats}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CustomBarChartState();
}

class CustomBarChartState extends State<CustomBarChart> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: const Color(0xff2c4260),
        child: BarChart(
          BarChartData(
              alignment: BarChartAlignment.spaceAround,
            maxY: 50,
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.black.withOpacity(0.2),
                tooltipMargin: 8,
                getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                    ) {
                  return BarTooltipItem(
                    rod.y.round().toString(),
                    TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) => const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return '${widget.goalStats[0].playerName}';
                    case 1:
                      return '${widget.goalStats[1].playerName}';
                    case 2:
                      return '${widget.goalStats[2].playerName}';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(showTitles: true),
            ),
            borderData: FlBorderData(
              show: true,
            ),
           barGroups: List.generate(3, (index) =>  BarChartGroupData(
             x: index,
             barRods: [
               BarChartRodData(y: widget.goalStats[index].totalGoals.toDouble(), colors: [Colors.lightBlueAccent, Colors.greenAccent])
             ],
             showingTooltipIndicators: [0],
           ),)
          ),
          swapAnimationDuration: Duration(milliseconds: 150), // Optional
          swapAnimationCurve: Curves.linear,
        ),
      );
  }
}