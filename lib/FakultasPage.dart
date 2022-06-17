import 'dart:ui';

import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'chart/developer_series.dart';
import 'chart/developer_chart.dart';
import 'package:pie_chart/pie_chart.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'line_chart/line_chart_sample2.dart';
import 'fakultas-1.dart';
import 'fakultas-2.dart';
import 'fakultas-3.dart';
import 'fakultas-4.dart';
import 'fakultas-5.dart';

class FakultasPage extends StatefulWidget {
  const FakultasPage({Key? key}) : super(key: key);

  @override
  State<FakultasPage> createState() => _FakultasPageState();
}

class _FakultasPageState extends State<FakultasPage> {
  Map<String, double> dataMap = {
    "Magister - S2": 500,
    "Doktor - S3": 150,
    "Professor": 15,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(320.0),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 10, 154, 48),
                Color.fromARGB(255, 7, 71, 33)
              ])),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: const Text('Fakultas'),
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(.0),
              child: ListView(
                children: [
                  const SizedBox(height: 55),
                  Fakultas1(),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            //ubah chart
            const Divider(color: Colors.black12),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(14),
                child: Fakultas2()),
            const Divider(color: Colors.black12),
            const Text('Gelar Dosen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 10),
            Fakultas3(),
            const Divider(color: Colors.black12),
            const Text('Status Mahasiswa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 10),
            Fakultas4(),
            const Divider(color: Colors.black12),
            const SizedBox(height: 10),
            Fakultas5(),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
