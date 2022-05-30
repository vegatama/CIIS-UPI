import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({Key? key}) : super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    Color.fromARGB(255, 129, 208, 251),
    Color.fromARGB(255, 28, 75, 168),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Color.fromARGB(0, 254, 254, 254)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('JAN', style: style);
        break;
      // case 1:
      //   text = const Text('FEB', style: style);
      //   break;
      // case 2:
      //   text = const Text('MAR', style: style);
      //   break;
      // case 3:
      //   text = const Text('APR', style: style);
      //   break;
      // case 4:
      //   text = const Text('MEI', style: style);
      //   break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      // case 6:
      //   text = const Text('JUL', style: style);
      //   break;
      // case 7:
      //   text = const Text('AUG', style: style);
      //   break;
      // case 8:
      //   text = const Text('SEP', style: style);
      //   break;
      // case 9:
      //   text = const Text('OCT', style: style);
      //   break;
      // case 10:
      //   text = const Text('NOV', style: style);
      //   break;
      case 11:
        text = const Text('DES', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return text;
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 250:
        text = '250';
        break;
      case 500:
        text = '500';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Color.fromARGB(0, 16, 140, 242),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Color.fromARGB(93, 49, 112, 183),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
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
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        // border: Border.all(color: Color.fromARGB(255, 77, 55, 55), width: 1)
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 500,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 46),
            FlSpot(2.6, 350),
            FlSpot(4.9, 452),
            FlSpot(6.8, 100),
            FlSpot(8, 200),
            FlSpot(9.5, 129),
            FlSpot(11, 70),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
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
                  .map((color) => color.withOpacity(0.5))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
