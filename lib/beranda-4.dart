import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:percent_indicator/percent_indicator.dart';

class BerandaList {
  String jenis;
  String jumlah;
  double percent;
  BerandaList(
      {required this.jenis, required this.jumlah, required this.percent});
}

class Beranda {
  // ignore: non_constant_identifier_jeniss
  List<BerandaList> ListPop = <BerandaList>[];

  Beranda(List<dynamic> json) {
    // isi listPop disini
    for (var i = 0; i < 3; i++) {
      var jenis = json[i]["jenis_mhs"];
      var jumlah = json[i]["jml_mhs"];
      var percent = double.parse(json[i]["percent"]);
      ListPop.add(BerandaList(jenis: jenis, jumlah: jumlah, percent: percent));
    }
  }
  //map dari json ke atribut
  factory Beranda.fromJson(List<dynamic> json) {
    return Beranda(json);
  }
}

// ignore: use_key_in_widget_constructors, camel_case_types
class Beranda4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<Beranda4> {
  late Future<Beranda> futureBeranda;

  String url =
      "https://opensheet.elk.sh/1nTVgY_A1qE5wwZi76jh_5oSMWP5d11XSTjZfNhDa-3A/Beranda-4";

  //fetch data
  Future<Beranda> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return Beranda.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  @override
  void initState() {
    super.initState();
    futureBeranda = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Beranda>(
      future: futureBeranda,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
          children: <Widget>[
            const Text('Status Mahasiswa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(snapshot.data!.ListPop[0].jenis.toString()),
                Text(snapshot.data!.ListPop[0].jumlah.toString() +
                    " (" +
                    snapshot.data!.ListPop[0].percent.toString() +
                    "%)"),
              ],
            ),
            LinearPercentIndicator(
              lineHeight: 8.0,
              percent: snapshot.data!.ListPop[0].percent / 100,
              progressColor: Colors.blue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(snapshot.data!.ListPop[1].jenis.toString()),
                Text(snapshot.data!.ListPop[1].jumlah.toString() +
                    " (" +
                    snapshot.data!.ListPop[1].percent.toString() +
                    "%)"),
              ],
            ),
            LinearPercentIndicator(
              lineHeight: 8.0,
              percent: snapshot.data!.ListPop[1].percent / 100,
              progressColor: Colors.yellow,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(snapshot.data!.ListPop[2].jenis.toString()),
                Text(snapshot.data!.ListPop[2].jumlah.toString() +
                    " (" +
                    snapshot.data!.ListPop[2].percent.toString() +
                    "%)"),
              ],
            ),
            LinearPercentIndicator(
              lineHeight: 8.0,
              percent: snapshot.data!.ListPop[2].percent / 100,
              progressColor: Colors.red,
            ),
          ]);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
