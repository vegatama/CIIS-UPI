import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pie_chart/pie_chart.dart';

class MhsList {
  String jenis;
  double jumlah;
  MhsList({required this.jenis, required this.jumlah});
}

class Mhs {
  // ignore: non_constant_identifier_bulans
  List<MhsList> ListPop = <MhsList>[];

  Mhs(List<dynamic> json) {
    // isi listPop disini
    for (var i = 0; i < 3; i++) {
      var jenis = json[i]["jenis_mhs"];
      var jumlah = double.parse(json[i]["jml_mhs"]);
      ListPop.add(MhsList(jenis: jenis, jumlah: jumlah));
    }
  }
  //map dari json ke atribut
  factory Mhs.fromJson(List<dynamic> json) {
    return Mhs(json);
  }
}

// ignore: use_key_in_widget_constructors, camel_case_types
class Mhs2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<Mhs2> {
  late Future<Mhs> futureMhs;

  String url =
      "https://opensheet.elk.sh/1nTVgY_A1qE5wwZi76jh_5oSMWP5d11XSTjZfNhDa-3A/mhs-2";

  //fetch data
  Future<Mhs> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return Mhs.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  @override
  void initState() {
    super.initState();
    futureMhs = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Mhs>(
      future: futureMhs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var map1 = Map<String, double>.fromIterable(snapshot.data!.ListPop, key: (e) => e.jenis, value: (e) => e.jumlah);
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