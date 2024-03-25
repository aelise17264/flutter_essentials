// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, use_super_parameters, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/chatmessage.dart';
import 'package:flutter_application_1/widgets/chatbubble.dart';
import 'package:flutter_application_1/widgets/chatinput.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  final imageAddress = Image.asset('resource/catnap.jpg');

  List<ChatMessage> _messages = [
    ChatMessage(
      text: "First Message",
      id: '1',
      createdAt: 2131231242,
      author: Author(userName: 'opal1'),
    ),
    ChatMessage(
      text: "Second Message",
      id: '1',
      createdAt: 2131231242,
      author: Author(userName: 'fred2'),
    ),
    ChatMessage(
      text: "Third Message",
      id: '1',
      createdAt: 2131231242,
      author: Author(userName: 'opal1'),
    ),
  ];

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
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        message: _messages[index]);
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
