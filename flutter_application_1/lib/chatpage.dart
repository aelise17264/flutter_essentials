// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, use_super_parameters, prefer_final_fields

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/chatmessage.dart';
import 'package:flutter_application_1/widgets/chatbubble.dart';
import 'package:flutter_application_1/widgets/chatinput.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessage> _messages = [];
  _loadInitialMessages() async {
    final response =
        await rootBundle.loadString('resources/mock_messages.json');

    final List<dynamic> decodedList = jsonDecode(response) as List;

    final List<ChatMessage> _chatMessages = decodedList.map((listItem) {
      return ChatMessage.fromJson(listItem);
    }).toList();

    setState(() {
      _messages = _chatMessages;
    });
  }

  onMessageSent(ChatMessage entity) {
    _messages.add(entity);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadInitialMessages();
    super.initState();
  }

  // get onPressed => null;
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
                        alignment: _messages[index].author.userName == 'opal1'
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
          ChatInput(
            onSubmit: onMessageSent,
          )
        ]));
  }
}
