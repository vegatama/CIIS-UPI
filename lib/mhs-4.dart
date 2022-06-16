import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:percent_indicator/percent_indicator.dart';

class MhsList {
  String thn;
  String jumpub;
  String totpub;
  double percent;
  MhsList(
      {required this.thn,
      required this.jumpub,
      required this.totpub,
      required this.percent});
}

class Mhs {
  // ignore: non_constant_identifier_thns
  List<MhsList> ListPop = <MhsList>[];

  Mhs(List<dynamic> json) {
    // isi listPop disini
    for (var i = 0; i < 1; i++) {
      var thn = json[i]["tahun"];
      var jumpub = json[i]["jml_publikasi"];
      var totpub = json[i]["total_publikasi"];
      var percent = double.parse(json[i]["percent"]);
      ListPop.add(MhsList(
          thn: thn, jumpub: jumpub, totpub: totpub, percent: percent));
    }
  }
  //map dari json ke atribut
  factory Mhs.fromJson(List<dynamic> json) {
    return Mhs(json);
  }
}

// ignore: use_key_in_widget_constructors, camel_case_types
class Mhs4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<Mhs4> {
  late Future<Mhs> futureMhs;

  String url =
      "https://opensheet.elk.sh/1nTVgY_A1qE5wwZi76jh_5oSMWP5d11XSTjZfNhDa-3A/mhs-4";

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
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 30.0,
                  animation: true,
                  percent: snapshot.data!.ListPop[0].percent/100,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data!.ListPop[0].percent.toString()+"%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Text(
                        "dari keseluruhan",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 14.0),
                      ),
                      Text(
                        snapshot.data!.ListPop[0].totpub.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 14.0),
                      ),
                    ],
                  ),
                  header: Column(
                    children: [
                      Text(
                        "Jumlah Publikasi oleh Mahasiswa 2022",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      Text(
                        snapshot.data!.ListPop[0].jumpub.toString()+" Publikasi",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 14.0),
                      ),
                    ],
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.blue,
                ),
              ),
            ],
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
