import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'developer_series.dart';

class DeveloperChart extends StatelessWidget {
  final List<DeveloperSeries> data;
  final String judul;
  DeveloperChart({required this.data, required this.judul});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (DeveloperSeries series, _) => series.year,
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (DeveloperSeries series, _) => series.barColor)
    ];

    return Container(
      height: 250,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                this.judul,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                "Jan 2022 - Jul 2022",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
