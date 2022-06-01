import 'package:flutter/material.dart';
import 'package:flutter_application/main.dart';
import 'Dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFD4140), Color(0xFF060E39)])),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Image.asset(
                'assets/images/UPI.png',
                width: 130,
                height: 130,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "CISS UPI",
              style: TextStyle(
                color: Color.fromRGBO(253, 65, 64, 1),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Centralized Information System of UPI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 44,
            ),
            const TextField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "User Email",
                hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 26.0,
            ),
            const TextField(
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                hintText: "User Password",
                hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              "Don't remember your password?",
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(
              height: 88.0,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color.fromRGBO(234, 67, 53, 1),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return MyHomePage();
                  }));
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
