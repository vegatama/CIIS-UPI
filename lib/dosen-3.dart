import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:percent_indicator/percent_indicator.dart';

class DosenList {
  String status;
  String jumlah;
  String target;
  double percent;
  DosenList(
      {required this.status, required this.jumlah, required this.target, required this.percent});
}

class Dosen {
  // ignore: non_constant_identifier_statuss
  List<DosenList> ListPop = <DosenList>[];

  Dosen(List<dynamic> json) {
    // isi listPop disini
    for (var i = 0; i < 3; i++) {
      var status = json[i]["status_dosen"];
      var jumlah = json[i]["jml_dosen"];
      var target = json[i]["target_dosen"];
      var percent = double.parse(json[i]["percent"]);
      ListPop.add(DosenList(status: status, jumlah: jumlah, target: target, percent: percent));
    }
  }
  //map dari json ke atribut
  factory Dosen.fromJson(List<dynamic> json) {
    return Dosen(json);
  }
}

// ignore: use_key_in_widget_constructors, camel_case_types
class Dosen3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<Dosen3> {
  late Future<Dosen> futureDosen;

  String url =
      "https://opensheet.elk.sh/1nTVgY_A1qE5wwZi76jh_5oSMWP5d11XSTjZfNhDa-3A/dosen-3";

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
          return Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        snapshot.data!.ListPop[0].status.toString(),
                      ),
                      LinearPercentIndicator(
                        lineHeight: 8.0,
                        percent: snapshot.data!.ListPop[0].percent/100,
                        progressColor: Colors.green,
                      ),
                      Text(
                        snapshot.data!.ListPop[0].jumlah.toString()+" dari "+snapshot.data!.ListPop[0].target.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                Text(
                  snapshot.data!.ListPop[0].percent.toString() +"%",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        snapshot.data!.ListPop[1].status.toString(),
                      ),
                      LinearPercentIndicator(
                        lineHeight: 8.0,
                        percent: snapshot.data!.ListPop[1].percent/100,
                        progressColor: Colors.green,
                      ),
                      Text(
                        snapshot.data!.ListPop[1].jumlah.toString()+" dari "+snapshot.data!.ListPop[1].target.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                Text(
                  snapshot.data!.ListPop[1].percent.toString() +"%",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        snapshot.data!.ListPop[2].status.toString(),
                      ),
                      LinearPercentIndicator(
                        lineHeight: 8.0,
                        percent: snapshot.data!.ListPop[2].percent/100,
                        progressColor: Colors.green,
                      ),
                      Text(
                        snapshot.data!.ListPop[2].jumlah.toString()+" dari "+snapshot.data!.ListPop[0].target.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                Text(
                  snapshot.data!.ListPop[2].percent.toString() +"%",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ],
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
