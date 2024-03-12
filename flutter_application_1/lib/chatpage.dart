// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widgets/chatbubble.dart';
import 'package:flutter_application_1/widgets/chatinput.dart';

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
        body: Column(children: [
          Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        message: "Another Message");
                  })
              // (children: [
              //   ChatBubble(
              //       alignment: Alignment.centerLeft, message: "Message #1"),
              //   ChatBubble(
              //       alignment: Alignment.centerRight, message: "Message #2"),
              //   ChatBubble(
              //       alignment: Alignment.centerLeft, message: "Message #3"),
              // ])

              ),
          ChatInput()
        ]));
  }
}
