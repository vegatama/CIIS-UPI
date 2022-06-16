import 'dart:ui';

import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'dosen-1.dart';
import 'dosen-2.dart';
import 'dosen-3.dart';
import 'dosen-4.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'chart/developer_chart.dart';
import 'package:pie_chart/pie_chart.dart';

class DosenPage extends StatefulWidget {
  const DosenPage({Key? key}) : super(key: key);

  @override
  State<DosenPage> createState() => _DosenPageState();
}

class _DosenPageState extends State<DosenPage> {

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
                Color.fromARGB(255, 19, 54, 232),
                Color(0xFF060E39)
              ])),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: const Text('Dosen'),
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(7.0),
              child: ListView(
                children: [
                  const SizedBox(height: 55),
                  Dosen1(),
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
            const Text('Gelar Dosen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 10),
            Dosen2(),
            const Divider(color: Colors.black12),
            const SizedBox(height: 10),  
            Dosen3(),
            const Divider(color: Colors.black12),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(14),
              child: Dosen4(),
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
