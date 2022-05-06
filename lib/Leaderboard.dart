import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

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
              child: AppBar(
                backgroundColor: const Color.fromARGB(255, 196, 162, 40),
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
                    labelPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    indicatorPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 1),
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
            body: TabBarView(children: [list(), list(), list()])));
  }

  SingleChildScrollView list() {
    return SingleChildScrollView(
      child: Column(
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
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1494256997604-768d1f608cac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1229&q=80"),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Abighail Shafira",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              Text(
                                "1900000",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              Text(
                                "Big Data, Data Visualization",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: const Text("${(0)} Pts",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                        thickness: 0.5,
                        color: Colors.white,
                        indent: 1,
                        endIndent: 1,
                      ),
                  itemCount: 10),
            ),
          )
        ],
      ),
    );
  }
}
