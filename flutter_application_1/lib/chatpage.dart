// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, use_super_parameters, prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/imagemodel.dart';
import 'package:flutter_application_1/models/chatmessage.dart';
import 'package:flutter_application_1/repo/imagerepo.dart';
import 'package:flutter_application_1/services/authservice.dart';
import 'package:flutter_application_1/widgets/chatbubble.dart';
import 'package:flutter_application_1/widgets/chatinput.dart';
import 'package:provider/provider.dart';

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

  final ImageRepo _imageRepo = ImageRepo();

  @override
  void initState() {
    // TODO: implement initState
    _loadInitialMessages();
    // _getNetworkImages();
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
                  context.read<AuthService>().logoutUser();
                  Navigator.popAndPushNamed(context, '/');
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Column(children: [
          FutureBuilder<List<PixelfromImage>>(
              future: _imageRepo.getNetworkImages(),
              builder:
                  ((context, AsyncSnapshot<List<PixelfromImage>> snapshot) {
                if (snapshot.hasData) {
                  return Image.network(snapshot.data![0].urlSmallSize);
                }

                return CircularProgressIndicator();
              })),
          Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: _messages[index].author.userName ==
                                context.read<AuthService>().getUserName()
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        message: _messages[index]);
                  })),
          ChatInput(
            onSubmit: onMessageSent,
          )
        ]));
  }
}
