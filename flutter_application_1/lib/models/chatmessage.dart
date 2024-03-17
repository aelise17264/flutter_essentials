import 'package:flutter/material.dart';

class ChatMessage {
  String text;
  String? imageUrl;
  String id;
  int createdAt;
  Author author;

  ChatMessage(
      {required this.text,
      required this.id,
      required this.createdAt,
      this.imageUrl,
      required this.author});
}

class Author {
  String userName;
  Author({required this.userName});
}
