import 'dart:ui';

import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'chart/developer_series.dart';
import 'chart/developer_chart.dart';
import 'package:pie_chart/pie_chart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<DeveloperSeries> data = [
    DeveloperSeries(
      year: "JAN",
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "FEB",
      developers: 5000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "MAR",
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "APR",
      developers: 35000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "MEI",
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "JUN",
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: "JUL",
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];
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
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFD4140), Color(0xFF060E39)])),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: const Text('CISS UPI'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Selamat Datang, Budiman",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                )),
            const Text("Last Updated 2022.03.01 08:00",
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w100,
                )),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: DeveloperChart(
                  data: data,
                  judul: "Tren Publikasi Universitas",
                )),
            const Divider(color: Colors.black12),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CircularPercentIndicator(
                      radius: 100.0,
                      lineWidth: 30.0,
                      animation: true,
                      percent: 0.76,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "76.0%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                          Text(
                            "dari target",
                            style: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 14.0),
                          ),
                          Text(
                            "150.000",
                            style: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 14.0),
                          ),
                        ],
                      ),
                      header: Column(
                        children: const [
                          Text(
                            "Jumlah Publikasi 2022",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17.0),
                          ),
                          Text(
                            "100.000 Publikasi",
                            style: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 14.0),
                          ),
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.blue,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    'Perbandingan 2021',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  LinearPercentIndicator(
                                    lineHeight: 8.0,
                                    percent: 0.4,
                                    progressColor: Colors.green,
                                  ),
                                  const Text(
                                    "100.000 dari 65.000",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              '+35%',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.black12),
                        Row(
                          children: const [
                            Text(
                              'Fakultas Terbaik',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            Text(
                              "(Publikasi)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/crown.png',
                              width: 45,
                            ),
                            const Text(
                              "FPMIPA",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.black12),
                        Row(
                          children: const [
                            Text(
                              'Prodi Terbaik',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            Text(
                              "(Publikasi)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/crown.png',
                              width: 45,
                            ),
                            const Text(
                              "Ilmu Komputer",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.black12),
            const Text('Sebaran Gelar Dosen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 10),
            PieChart(
              dataMap: dataMap,
              chartType: ChartType.ring,
              animationDuration: const Duration(milliseconds: 500),
              chartRadius: MediaQuery.of(context).size.width / 3,
              legendOptions: const LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.left,
                showLegends: true,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
                decimalPlaces: 2,
              ),
            ),
            const Divider(color: Colors.black12),
            const SizedBox(height: 10),
            const Text('Status Mahasiswa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Mahasiswa Aktif"),
                Text("100.000 (50%)"),
              ],
            ),
            LinearPercentIndicator(
              lineHeight: 8.0,
              percent: 0.9,
              progressColor: Colors.blue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Cuti"),
                Text("100.000 (50%)"),
              ],
            ),
            LinearPercentIndicator(
              lineHeight: 8.0,
              percent: 0.9,
              progressColor: Colors.yellow,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Drop Out"),
                Text("100.000 (50%)"),
              ],
            ),
            LinearPercentIndicator(
              lineHeight: 8.0,
              percent: 0.9,
              progressColor: Colors.red,
            ),
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
