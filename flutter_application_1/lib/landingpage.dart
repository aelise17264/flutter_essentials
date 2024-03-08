// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Button Clicked");
          },
        ),
        body: Column(children: [
          Text(
            "Let's sign you in!",
            style: TextStyle(
              fontSize: 30,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Center(
          // child:
          Text(
            "Welcome Back \n You've been missed!",
            style: TextStyle(
              fontSize: 20,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.center,
          ),

          Image(image: AssetImage('../resources/banner_image.png')),
          Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey,
            ),
            child: FlutterLogo(),
          )
          // )
        ]));
  }
}
