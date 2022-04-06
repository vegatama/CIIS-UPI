import 'package:flutter/material.dart';
import 'splash-screen.dart';
import 'Leaderboard.dart';
import 'Dashboard.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                    child: Text('Login'),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                    child: Text('Splash Screen'),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SplashScreen();
                      }));
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                    child: Text('Leaderboard'),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Profile();
                      }));
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                    child: Text('Dashboard'),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return MyHomePage();
                      }));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
