// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/chatmessage.dart';
import 'package:flutter_application_1/utils/brandcolors.dart';
import 'package:flutter_application_1/widgets/chatbubble.dart';
import 'package:flutter_application_1/widgets/chatinput.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  // get onPressed => null;
  // final String username;
  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Welcome Back $username",
            // style: TextStyle(color: BrandColor.secondaryColor),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/');
                },
                icon: Icon(Icons.logout))
          ],
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
                        message: ChatMessage(
                            id: '4321',
                            text: 'First Message',
                            createdAt: DateTime.now().microsecondsSinceEpoch,
                            author: Author(userName: "user2")));
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
