import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'leaderboard-1.dart';
import 'leaderboard-2.dart';
import 'leaderboard-3.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(130.0),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Color.fromARGB(255, 232, 190, 41),
                      Color.fromARGB(255, 62, 61, 9)
                    ])),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  title: Column(children: const [
                    Text(
                      "Prestasi",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Leaderboard",
                      style: TextStyle(fontSize: 19),
                    ),
                  ]),
                  centerTitle: true,
                  bottom: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.black,
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      indicatorPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 1),
                      unselectedLabelColor: Colors.white,
                      indicator: const BubbleTabIndicator(
                        indicatorHeight: 33,
                        indicatorColor: Colors.white,
                        tabBarIndicatorSize: TabBarIndicatorSize.tab,
                        indicatorRadius: 30,
                      ),
                      tabs: [
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.white)),
                            child: const Text("Mahasiswa")),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.white)),
                            child: const Text("Alumni")),
                        Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.white)),
                            child: const Text("Dosen")),
                      ]),
                ),
              ),
            ),
            body: TabBarView(children: [leaderboard1(), leaderboard2(), leaderboard3()])));
  }
}


