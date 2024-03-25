// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/chatmessage.dart';
import 'package:flutter_application_1/utils/brandcolors.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final Alignment alignment;

  const ChatBubble({Key? key, required this.alignment, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
        padding: EdgeInsets.all(24),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
            color: BrandColor.thirdColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12))),
        child: Column(
          children: [
            Text(message.text, style: TextStyle(fontSize: 20)),
            if (message.imageUrl != null)
              Image.network(
                '${message.imageUrl}',
                height: 200,
              )

            // Icon(
            //   Icons.question_answer,
            // )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
