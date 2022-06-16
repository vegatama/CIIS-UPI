import 'dart:ui';

import 'package:flutter/material.dart';
import 'NavBar.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'mhs-1.dart';
import 'mhs-2.dart';
import 'mhs-3.dart';
import 'mhs-4.dart';

class MahasiswaPage extends StatefulWidget {
  const MahasiswaPage({Key? key}) : super(key: key);

  @override
  State<MahasiswaPage> createState() => _MahasiswaPageState();
}

class _MahasiswaPageState extends State<MahasiswaPage> {
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
                  Mhs1(),
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
            Mhs2(),
            const Divider(color: Colors.black12),
            const SizedBox(height: 10),
            Mhs3(),
            const Divider(color: Colors.black12),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(14),
              child: Mhs4(),
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
