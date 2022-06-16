import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LeaderboardList {
  String name;
  String nim;
  String pts;
  String specialization;
  String picturl;
  LeaderboardList(
      {required this.name,
      required this.nim,
      required this.pts,
      required this.specialization,
      required this.picturl});
}

class Leaderboard {
  // ignore: non_constant_identifier_names
  List<LeaderboardList> ListPop = <LeaderboardList>[];

  Leaderboard(List<dynamic> json) {
    // isi listPop disini
    for (var i = 0; i < 50; i++) {
      var name = json[i]["name"];
      var nim = json[i]["nim"];
      var pts = json[i]["pts"];
      var specialization = json[i]["specialization"];
      var picturl = json[i]["pict_url"];
      ListPop.add(LeaderboardList(
          name: name,
          nim: nim,
          pts: pts,
          specialization: specialization,
          picturl: picturl));
    }
  }
  //map dari json ke atribut
  factory Leaderboard.fromJson(List<dynamic> json) {
    return Leaderboard(json);
  }
}

// ignore: use_key_in_widget_constructors, camel_case_types
class leaderboard1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//class state
class MyAppState extends State<leaderboard1> {
  late Future<Leaderboard> futureLeaderboard;

  String url =
      "https://opensheet.elk.sh/1nTVgY_A1qE5wwZi76jh_5oSMWP5d11XSTjZfNhDa-3A/leaderboard-1";

  //fetch data
  Future<Leaderboard> fetchData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // jika server mengembalikan 200 OK (berhasil),
      // parse json
      return Leaderboard.fromJson(jsonDecode(response.body));
    } else {
      // jika gagal (bukan  200 OK),
      // lempar exception
      throw Exception('Gagal load');
    }
  }

  @override
  void initState() {
    super.initState();
    futureLeaderboard = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: FutureBuilder<Leaderboard>(
          future: futureLeaderboard,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: SizedBox(
              height: 570,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: Color.fromARGB(150, 108, 108, 108),
                      leading: Text("${index + 1}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data!.ListPop[index].picturl.toString()),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.ListPop[index].name.toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            Text(
                              snapshot.data!.ListPop[index].nim.toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                            Text(
                              snapshot.data!.ListPop[index].specialization
                                  .toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Text(snapshot.data!.ListPop[index].pts.toString() + " Pts",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                        thickness: 0.5,
                        color: Colors.white,
                        indent: 1,
                        endIndent: 1,
                      ),
                  itemCount: snapshot.data!.ListPop.length,),
            ),
          )
        ],
      );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      );
  }
}
