import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.0), // here the desired height
          child: AppBar(
            backgroundColor: Color.fromARGB(255, 196, 162, 40),
            leading: Icon(Icons.arrow_back),
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
            flexibleSpace: SafeArea(
              child: Container(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(width: 40),
                    Expanded(
                      child: ElevatedButton(
                        child: Text(
                          "Mahasiswa",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(width: 2.0, color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        child: Text(
                          "Alumni",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black.withOpacity(0.05),
                          side: BorderSide(width: 2.0, color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        child: Text(
                          "Dosen",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black.withOpacity(0.05),
                          side: BorderSide(width: 2.0, color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: SizedBox(
                  height: 570,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          tileColor: Color.fromARGB(150, 108, 108, 108),
                          leading: Text("${index + 1}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.center),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1494256997604-768d1f608cac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1229&q=80"),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                          trailing: Text("${(0)} Pts",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
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
        ));
  }
}
