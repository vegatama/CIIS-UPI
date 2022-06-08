import 'package:charts_flutter/flutter.dart' as charts;

class DeveloperSeries {
  final String year;
  final double developers;
  final charts.Color barColor;

  DeveloperSeries(
    {
      required this.year,
      required this.developers,
      required this.barColor
    }
  );
}