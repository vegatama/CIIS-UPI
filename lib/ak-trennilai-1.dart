import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'chart/developer_series.dart';
import 'chart/developer_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Nilai {
  // ignore: non_constant_identifier_fakultas
  List<DeveloperSeries> ListPop = <DeveloperSeries>[];

  Nilai(List<dynamic> json) {
    // isi listPop disini
    for (var i = 0; i < 8; i++) {
      var fakultas = json[i]["fakultas"];
      var avgipk = double.parse(json[i]["avg_ipk"]);
        ListPop.add(DeveloperSeries(
            year: fakultas,
            developers: avgipk,
            barColor: charts.ColorUtil.fromDartColor(Colors.blue)));
    }
  }
  //map dari json ke atribut
  factory Nilai.fromJson(List<dynamic> json) {
    return Nilai(json);
  }
}

// ignore: use_key_in_widget_constructors, camel_case_types
class Nilai1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<Nilai1> {
  late Future<Nilai> futureNilai;

  String url =
      "https://opensheet.elk.sh/1nTVgY_A1qE5wwZi76jh_5oSMWP5d11XSTjZfNhDa-3A/ak-trennilai-1";

  //fetch data
  Future<Nilai> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return Nilai.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  @override
  void initState() {
    super.initState();
    futureNilai = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Nilai>(
      future: futureNilai,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DeveloperChart(
            data: snapshot.data!.ListPop,
            judul: "Rata-rata IPK Fakutas",
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