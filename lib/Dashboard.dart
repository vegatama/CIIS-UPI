import 'package:flutter/material.dart';
import 'NavBar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        title: const Text('CISS UPI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Selamat Datang, Budiman",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  )
              ),
              const Text("Last Updated 2022.03.01 08:00",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w100,
                  )
              ),
              Image.network(
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Froboguru.ruangguru.com%2Fquestion%2Flook-at-the-line-chart-below-and-answer-the-question-a-brief_vpIMfJCxEgu&psig=AOvVaw2QGt_V44D0me-3q057R2_j&ust=1651925805720000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJi-srTtyvcCFQAAAAAdAAAAABAD',
                width: 130,
                height: 130,
              ),
            ],
        ),
      ),
    );
  }
}
