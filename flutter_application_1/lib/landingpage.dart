// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  void loginUser() {
    print("login user successful!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        // drawer: Drawer(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     print("Button Clicked");
        //   },
        // ),
        body: Center(
            child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Let's sign you in!",
              textAlign: TextAlign.center,
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

            Image(
              image: AssetImage('../resources/banner_image.png'),
              height: 250,
            ),
            ElevatedButton(
                onPressed: loginUser,
                child: Text("Click me to login!",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w300))),
            OutlinedButton(onPressed: () {}, child: FlutterLogo()),
            TextButton(
                onPressed: () {
                  print("Click the URL!");
                },
                child: Text("Text button"))
          ]),
    )));

    // Container(
    //   height: 50,
    //   width: 50,
    //   padding: EdgeInsets.all(10),
    //   margin: EdgeInsets.all(50),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(10.0),
    //     color: Colors.grey,
    //   ),
    //   child: FlutterLogo(),
    // )
    // )
  }
}
