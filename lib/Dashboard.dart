import 'dart:ui';

import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        title: const Text('CISS UPI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Image.network(
              'https://miro.medium.com/max/1400/1*7vT2GwcznErKQUARBw5fVQ.png',
              fit: BoxFit.fitWidth,
              // height: 350,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: const Text('Bagan 1')),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Bagan 1'),
                            const Text('Bagan 2'),
                            const Text('Bagan 3'),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Bagan 1'),
                            const Text('Bagan 2'),
                            const Text('Bagan 3'),
                            const Text('Bagan 4'),
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: const Text('Bagan 1')),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 10),
            const Text('Status Mahasiswa',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Mahasiswa Aktif"),
                const Text("100.000 (50%)"),
              ],
            ),
            new LinearPercentIndicator(
              lineHeight: 8.0,
              percent: 0.9,
              progressColor: Colors.blue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Cuti"),
                const Text("100.000 (50%)"),
              ],
            ),
            new LinearPercentIndicator(
              lineHeight: 8.0,
              percent: 0.9,
              progressColor: Colors.yellow,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Drop Out"),
                const Text("100.000 (50%)"),
              ],
            ),
            new LinearPercentIndicator(
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
