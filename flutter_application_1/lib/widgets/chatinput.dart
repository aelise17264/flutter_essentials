// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/chatmessage.dart';

import '../utils/brandcolors.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessage) onSubmit;

  ChatInput({Key? key, required this.onSubmit}) : super(key: key);
  // get onPressed => null;

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print("Chat message sent");

    final newChatMessage = ChatMessage(
        text: chatMessageController.text,
        id: '244',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(userName: 'opal1'));

    onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.add, color: Colors.white)),
            Expanded(
              child: TextField(
                controller: chatMessageController,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 1,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your message",
                  hintStyle: TextStyle(color: BrandColor.backgroundColor),
                ),
              ),
            ),
            IconButton(
                onPressed: onSendButtonPressed,
                icon: Icon(Icons.send, color: Colors.white)),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))));
  }
}
