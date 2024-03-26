// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/chatmessage.dart';
import 'package:flutter_application_1/services/authservice.dart';
import 'package:flutter_application_1/widgets/imagepicker.dart';
import 'package:provider/provider.dart';

import '../utils/brandcolors.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessage) onSubmit;

  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  // get onPressed => null;
  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    print("Chat message sent");

    final newChatMessage = ChatMessage(
        text: chatMessageController.text,
        id: '244',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(userName: context.read<AuthService>().getUserName()));

    if (_selectedImageUrl.isNotEmpty) {
      newChatMessage.imageUrl = _selectedImageUrl;
    }

    widget.onSubmit(newChatMessage);

    chatMessageController.clear();
    _selectedImageUrl = '';
    setState(() {});
  }

  String _selectedImageUrl = '';

  void onImageDisplay(String newImageUrl) {
    setState(() {
      _selectedImageUrl = newImageUrl;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return NetworkImagePickerBody(
                          onImageSelected: onImageDisplay,
                        );
                      });
                },
                icon: Icon(Icons.add, color: Colors.white)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
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
                  if (_selectedImageUrl.isNotEmpty)
                    Image.network(_selectedImageUrl, height: 50),
                ],
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
