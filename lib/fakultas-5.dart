import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:percent_indicator/percent_indicator.dart';

class FakultasList {
  String status_dosen;
  String jumlah;
  double percent;
  FakultasList(
      {required this.status_dosen,
      required this.jumlah,
      required this.percent});
}

class Fakultas {
  // ignore: non_constant_identifier_status_dosens
  List<FakultasList> ListPop = <FakultasList>[];

  Fakultas(List<dynamic> json) {
    // isi listPop disini
    for (var i = 0; i < 3; i++) {
      var status_dosen = json[i]["status_dosen"];
      var jumlah = json[i]["jml_dosen"];
      var percent = double.parse(json[i]["percent"]);
      ListPop.add(FakultasList(
          status_dosen: status_dosen, jumlah: jumlah, percent: percent));
    }
  }
  //map dari json ke atribut
  factory Fakultas.fromJson(List<dynamic> json) {
    return Fakultas(json);
  }
}

// ignore: use_key_in_widget_constructors, camel_case_types
class Fakultas5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<Fakultas5> {
  late Future<Fakultas> futureFakultas;

  String url =
      "https://opensheet.elk.sh/1nTVgY_A1qE5wwZi76jh_5oSMWP5d11XSTjZfNhDa-3A/fakultas-5";

  //fetch data
  Future<Fakultas> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return Fakultas.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  @override
  void initState() {
    super.initState();
    futureFakultas = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Fakultas>(
      future: futureFakultas,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(children: <Widget>[
            const Text('Status Dosen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(snapshot.data!.ListPop[0].status_dosen.toString()),
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
                Text(snapshot.data!.ListPop[1].status_dosen.toString()),
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
                Text(snapshot.data!.ListPop[2].status_dosen.toString()),
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
