import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'chart/developer_series.dart';
import 'chart/developer_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Publikasi {
  // ignore: non_constant_identifier_bulans
  List<DeveloperSeries> ListPop = <DeveloperSeries>[];

  Publikasi(List<dynamic> json) {
    // isi listPop disini
    for (var i = 0; i < 12; i++) {
      var bulan = json[i]["bulan"];
      var totalpub = double.parse(json[i]["total_publikasi"]);
      ListPop.add(DeveloperSeries(
          year: bulan,
          developers: totalpub,
          barColor: charts.ColorUtil.fromDartColor(Colors.green)));
    }
  }
  //map dari json ke atribut
  factory Publikasi.fromJson(List<dynamic> json) {
    return Publikasi(json);
  }
}

// ignore: use_key_in_widget_constructors, camel_case_types
class Publikasi1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<Publikasi1> {
  late Future<Publikasi> futurePublikasi;

  String url =
      "https://opensheet.elk.sh/1nTVgY_A1qE5wwZi76jh_5oSMWP5d11XSTjZfNhDa-3A/ak-pub-2";

  //fetch data
  Future<Publikasi> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return Publikasi.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePublikasi = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Publikasi>(
      future: futurePublikasi,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DeveloperChart(
            data: snapshot.data!.ListPop,
            judul: "Tren Publikasi Fakultas",
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
