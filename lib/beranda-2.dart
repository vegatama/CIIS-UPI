import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:percent_indicator/percent_indicator.dart';

class BerandaList {
  String thn;
  String jumpub;
  String tarpub;
  String perctar;
  BerandaList(
      {required this.thn,
      required this.jumpub,
      required this.tarpub,
      required this.perctar});
}

class Beranda {
  // ignore: non_constant_identifier_thns
  List<BerandaList> ListPop = <BerandaList>[];

  Beranda(List<dynamic> json) {
    // isi listPop disini
    for (var i = 0; i < 2; i++) {
      var thn = json[i]["thn"];
      var jumpub = json[i]["jml_publikasi"];
      var tarpub = json[i]["target_publikasi"];
      var perctar = json[i]["percent_target"];
      ListPop.add(BerandaList(
          thn: thn, jumpub: jumpub, tarpub: tarpub, perctar: perctar));
    }
  }
  //map dari json ke atribut
  factory Beranda.fromJson(List<dynamic> json) {
    return Beranda(json);
  }
}

// ignore: use_key_in_widget_constructors, camel_case_types
class Beranda2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<Beranda2> {
  late Future<Beranda> futureBeranda;

  String url =
      "https://opensheet.elk.sh/1nTVgY_A1qE5wwZi76jh_5oSMWP5d11XSTjZfNhDa-3A/Beranda-2";

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
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 30.0,
                  animation: true,
                  percent: 0.76,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data!.ListPop[0].perctar.toString()+"%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      Text(
                        "dari target",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 14.0),
                      ),
                      Text(
                        snapshot.data!.ListPop[0].tarpub.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 14.0),
                      ),
                    ],
                  ),
                  header: Column(
                    children: [
                      Text(
                        "Jumlah Publikasi 2022",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                      Text(
                        snapshot.data!.ListPop[0].jumpub.toString() +
                            " Publikasi",
                        style: TextStyle(
                            fontWeight: FontWeight.w200, fontSize: 14.0),
                      ),
                    ],
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.blue,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                'Perbandingan 2021',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              LinearPercentIndicator(
                                lineHeight: 8.0,
                                percent: 0.4,
                                progressColor: Colors.green,
                              ),
                              Text(
                                snapshot.data!.ListPop[0].jumpub.toString()+" dari "+snapshot.data!.ListPop[1].jumpub.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          '+35%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.black12),
                    Row(
                      children: const [
                        Text(
                          'Fakultas Terbaik',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        Text(
                          "(Publikasi)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/crown.png',
                          width: 45,
                        ),
                        const Text(
                          "FPMIPA",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.black12),
                    Row(
                      children: const [
                        Text(
                          'Prodi Terbaik',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        Text(
                          "(Publikasi)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/crown.png',
                          width: 45,
                        ),
                        const Text(
                          "Ilmu Komputer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ],
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
