import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))));
  }
}