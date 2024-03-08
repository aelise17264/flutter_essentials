// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Welcome Back User",
            textAlign: TextAlign.center,
          ),
          actions: [IconButton(onPressed: onPressed, icon: Icon(Icons.logout))],
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            // ignore: prefer_const_literals_to_create_immutables
            child: Column(
              children: [
                Text("This is your message", style: TextStyle(fontSize: 20)),
                Icon(
                  Icons.question_answer,
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Column(
              children: [
                Text("This is your message", style: TextStyle(fontSize: 20)),
                Icon(
                  Icons.question_answer,
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Column(
              children: [
                Text("This is your message", style: TextStyle(fontSize: 20)),
                Icon(
                  Icons.question_answer,
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          Container(
              height: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(Icons.add, color: Colors.white)),
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(Icons.send, color: Colors.white)),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20)))),
        ]));
  }
}
