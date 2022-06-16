import 'dart:ui';

import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'beranda-1.dart';
import 'beranda-2.dart';
import 'beranda-3.dart';
import 'beranda-4.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
            Padding(padding: const EdgeInsets.all(10.0), child: Beranda1()),
            const Divider(color: Colors.black12),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(14),
              child: Beranda2()
                  
            ),
            const Divider(color: Colors.black12),
            const Text('Sebaran Gelar Dosen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 10),
            Beranda3(),
            const Divider(color: Colors.black12),
            const SizedBox(height: 10),
            Beranda4(),
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
