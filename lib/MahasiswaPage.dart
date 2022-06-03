import 'dart:ui';

import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'chart/developer_series.dart';
import 'chart/developer_chart.dart';
import 'package:pie_chart/pie_chart.dart';

class MahasiswaPage extends StatefulWidget {
  const MahasiswaPage({Key? key}) : super(key: key);

  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
  final List<DeveloperSeries> data = [
    DeveloperSeries(
      year: "FPMIPA",
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.grey),
    ),
    DeveloperSeries(
      year: "FPTK",
      developers: 5000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    DeveloperSeries(
      year: "FPOK",
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    DeveloperSeries(
      year: "FPBS",
      developers: 35000,
      barColor: charts.ColorUtil.fromDartColor(Colors.grey),
    ),
    DeveloperSeries(
      year: "FPIPS",
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    DeveloperSeries(
      year: "FIP",
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.grey),
    ),
    DeveloperSeries(
      year: "FPEB",
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.grey),
    ),
  ];
  Map<String, double> dataMap = {
    "Mahasiswa Aktif": 500,
    "Cuti": 150,
    "Drop Out": 15,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(320.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 19, 54, 232),
                    Color(0xFF060E39)
                  ])),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: const Text('Mahasiswa'),
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(7.0),
              child: ListView(
                children: [
                  const SizedBox(height: 55),
                  DeveloperChart(
                    data: data,
                    judul: "Tren Publikasi Mahasiswa",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color: Colors.black12),
            const Text('Status Mahasiswa',
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
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Mahasiswa yang Lulus Tahun Ini',
                      ),
                      LinearPercentIndicator(
                        lineHeight: 8.0,
                        percent: 0.4,
                        progressColor: Colors.green,
                      ),
                      const Text(
                        "100.000 dari 65.000",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                const Text(
                  '+35%',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Mahasiswa yang Sedang Mengikuti Program',
                      ),
                      LinearPercentIndicator(
                        lineHeight: 8.0,
                        percent: 0.4,
                        progressColor: Colors.green,
                      ),
                      const Text(
                        "100.000 dari 65.000",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                const Text(
                  '+35%',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ],
            ),
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
                            "dari keseluruhan",
                            style: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 14.0),
                          ),
                          Text(
                            "100.000",
                            style: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 14.0),
                          ),
                        ],
                      ),
                      header: Column(
                        children: const [
                          Text(
                            "Jumlah Publikasi oleh Mahasiswa 2022",
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
                ],
              ),
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
