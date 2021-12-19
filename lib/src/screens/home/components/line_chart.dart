import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyLineChart extends StatefulWidget {
  const MyLineChart({Key? key}) : super(key: key);

  @override
  _MyLineChartState createState() => _MyLineChartState();
}

class _MyLineChartState extends State<MyLineChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Theme.of(context)
                  .primaryColorDark, // TODO: change to theme color
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 12, //18.0,
                left: 12.0,
                top: 12, //24,
                bottom: 12,
              ),
              child: LineChart(mainData()),
            ),
          ),
        )
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: false,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            // Cases Here.
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) =>
              Theme.of(context).textTheme.caption?.copyWith(
                    color: Theme.of(context).primaryColorLight,
                  ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1000:
                return '10';
              // TODO: calorie cases here
            }
            return '';
          },
          margin: 5,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 31, // Days in month
      minY: 0,
      maxY: 1000, //TODO: Maximum calories a human can spend
      lineBarsData: [
        LineChartBarData(
          spots: const [
            // Date, Kcals

            // Starting date of application
            FlSpot(0, 0),
            // FlSpot(6.8, 3.1),
            FlSpot(1, 400),
            FlSpot(2, 0),
            FlSpot(3, 100),
            // FlSpot(4, 900),
            FlSpot(5, 0),
            FlSpot(5, 100),
            FlSpot(5, 500),
            FlSpot(5, 600),
            FlSpot(6, 600),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
