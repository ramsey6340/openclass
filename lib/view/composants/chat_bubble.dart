import 'package:flutter/material.dart';
import '../constante.dart';

/// Widget permettant de créer des bulles de chat qui vont contenir les messages de chat

class ChatBubble extends StatelessWidget
{
  const ChatBubble({Key?key, required this.text, required this.time, required this.is_me}):super(key: key);
  final String text;
  final String time;
  final bool is_me;
  @override
  Widget build(BuildContext context)
  {
    return Row(
      mainAxisAlignment: (is_me)?MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
        Container(
          margin: (is_me)?const EdgeInsets.only(top: 5, bottom: 5, right: 10):const EdgeInsets.only(top: 5, bottom: 5, left: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
              color: (is_me)?kColorPrimary:Colors.grey,
              borderRadius: BorderRadius.circular(8)
          ),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width*0.8
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(text),
              Text(time)
            ],
          ),
        )
      ],
    );
  }
}