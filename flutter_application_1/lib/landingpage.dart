// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/chatpage.dart';
import 'package:flutter_application_1/utils/brandcolors.dart';
import 'package:flutter_application_1/utils/spaces.dart';
import 'package:flutter_application_1/utils/textfieldstyles.dart';
import 'package:flutter_application_1/widgets/logintextfield.dart';
import 'package:url_launcher/url_launcher.dart';

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  final _formkey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      // navigate to chat page
      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');
      // MaterialPageRoute(
      //     builder: (context) => ChatPage(
      //           username: userNameController.text,
      //         ))
      //         );

      print("login user successful!");
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final Uri urlLink = Uri.parse('https://brander-portfolio.netlify.app/');

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
                color: BrandColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Center(
            // child:
            Text(
              "Welcome Back \n You've been missed!",
              style: TextStyle(
                fontSize: 20,
                color: BrandColor.secondaryColor,
              ),
              textAlign: TextAlign.center,
            ),

            Image.asset(
              'resources/banner_image.png',
              height: 150,
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  LoginTextField(
                    controller: userNameController,
                    hintText: "Add your username",
                    validator: (value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          value.length < 5) {
                        return "Your username needs to have at least 5 characters";
                      } else if (value != null && value.isEmpty) {
                        return "Do not forget to add your username";
                      }
                      return null;
                    },
                  ),
                  verticalSpacer(24),
                  LoginTextField(
                    controller: passwordController,
                    hintText: "Enter a strong password",
                    hasObscurity: true,
                  ),
                ],
              ),
            ),
            verticalSpacer(24),

            ElevatedButton(
                onPressed: () {
                  loginUser(context);
                },
                child: Text("Login!",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w300))),
            OutlinedButton(onPressed: () {}, child: FlutterLogo()),
            GestureDetector(
              onTap: () async {
                //todo
                print("Link clicked");
                if (!await launchUrl(urlLink)) {
                  throw Exception('Could not launch $urlLink');
                }
              },
              child: Column(
                children: [
                  Text("Find us at this URL"),
                  Text("Text button"),
                ],
              ),
            )
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
