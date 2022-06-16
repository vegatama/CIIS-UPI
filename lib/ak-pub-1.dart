import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pie_chart/pie_chart.dart';

class PubList {
  String fakultas;
  double jumlah;
  PubList({required this.fakultas, required this.jumlah});
}

class Pub {
  // ignore: non_constant_identifier_bulans
  List<PubList> ListPop = <PubList>[];

  Pub(List<dynamic> json) {
    // isi listPop disini
    for (var i = 0; i < 8; i++) {
      var fakultas = json[i]["fakultas"];
      var jumlah = double.parse(json[i]["jml_publikasi"]);
      ListPop.add(PubList(fakultas: fakultas, jumlah: jumlah));
    }
  }
  //map dari json ke atribut
  factory Pub.fromJson(List<dynamic> json) {
    return Pub(json);
  }
}

// ignore: use_key_in_widget_constructors, camel_case_types
class Pub1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<Pub1> {
  late Future<Pub> futurePub;

  String url =
      "https://opensheet.elk.sh/1nTVgY_A1qE5wwZi76jh_5oSMWP5d11XSTjZfNhDa-3A/ak-pub-1";

  //fetch data
  Future<Pub> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return Pub.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePub = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pub>(
      future: futurePub,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var map1 = Map<String, double>.fromIterable(snapshot.data!.ListPop,
              key: (e) => e.fakultas, value: (e) => e.jumlah);
          return PieChart(
            dataMap: map1,
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
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
