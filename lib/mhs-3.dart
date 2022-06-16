import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:percent_indicator/percent_indicator.dart';

class MhsList {
  String status;
  String jumlah;
  String total;
  double percent;
  MhsList(
      {required this.status, required this.jumlah, required this.total, required this.percent});
}

class Mhs {
  // ignore: non_constant_identifier_statuss
  List<MhsList> ListPop = <MhsList>[];

  Mhs(List<dynamic> json) {
    // isi listPop disini
    for (var i = 0; i < 2; i++) {
      var status = json[i]["status_mhs"];
      var jumlah = json[i]["jml_mhs"];
      var total = json[i]["total_mhs"];
      var percent = double.parse(json[i]["percent"]);
      ListPop.add(MhsList(status: status, jumlah: jumlah, total: total, percent: percent));
    }
  }
  //map dari json ke atribut
  factory Mhs.fromJson(List<dynamic> json) {
    return Mhs(json);
  }
}

// ignore: use_key_in_widget_constructors, camel_case_types
class Mhs3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<Mhs3> {
  late Future<Mhs> futureMhs;

  String url =
      "https://opensheet.elk.sh/1nTVgY_A1qE5wwZi76jh_5oSMWP5d11XSTjZfNhDa-3A/mhs-3";

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
                        snapshot.data!.ListPop[0].jumlah.toString()+" dari "+snapshot.data!.ListPop[0].total.toString(),
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
                        snapshot.data!.ListPop[1].jumlah.toString()+" dari "+snapshot.data!.ListPop[1].total.toString(),
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