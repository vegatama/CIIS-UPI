import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pie_chart/pie_chart.dart';

class DosenList {
  String gelar;
  double jumlah;
  DosenList({required this.gelar, required this.jumlah});
}

class Dosen {
  // ignore: non_constant_identifier_bulans
  List<DosenList> ListPop = <DosenList>[];

  Dosen(List<dynamic> json) {
    // isi listPop disini
    for (var i = 0; i < 3; i++) {
      var gelar = json[i]["gelar_dosen"];
      var jumlah = double.parse(json[i]["jumlah"]);
      ListPop.add(DosenList(gelar: gelar, jumlah: jumlah));
    }
  }
  //map dari json ke atribut
  factory Dosen.fromJson(List<dynamic> json) {
    return Dosen(json);
  }
}

// ignore: use_key_in_widget_constructors, camel_case_types
class Dosen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<Dosen2> {
  late Future<Dosen> futureDosen;

  String url =
      "https://opensheet.elk.sh/1nTVgY_A1qE5wwZi76jh_5oSMWP5d11XSTjZfNhDa-3A/dosen-2";

  //fetch data
  Future<Dosen> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return Dosen.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  @override
  void initState() {
    super.initState();
    futureDosen = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Dosen>(
      future: futureDosen,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var map1 = Map<String, double>.fromIterable(snapshot.data!.ListPop, key: (e) => e.gelar, value: (e) => e.jumlah);
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