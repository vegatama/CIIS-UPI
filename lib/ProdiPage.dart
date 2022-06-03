import 'dart:ui';
import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'chart/developer_series.dart';
import 'chart/developer_chart.dart';
import 'package:pie_chart/pie_chart.dart';

class ProdiPage extends StatefulWidget {
  const ProdiPage({Key? key}) : super(key: key);

  @override
  State<ProdiPage> createState() => _ProdiPageState();
}

class _ProdiPageState extends State<ProdiPage> {
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
                  colors: [Color.fromARGB(255, 10, 154, 48), Color.fromARGB(255, 7, 71, 33)])),
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
          children: [
            //ubah chart
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: DeveloperChart(
                  data: data,
                  judul: "Tren Publikasi Program Studi",
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
                              'Peringkat Nilai di Universitas',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
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
                              "#1",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.black12),
                        Row(
                          children: const [
                            Text(
                              'Peringkat Nilai di Fakultas',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
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
                              "#1",
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
            const Text('Gelar Dosen',
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
                        'Dosen yang Sedang Menempuh Studi',
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
                        'Dosen yang Akan Pensiun Tahun ini',
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
