import 'package:flutter/material.dart';

import '../constante.dart';

class ChatBubble extends StatelessWidget
{
  ChatBubble({Key?key, required this.text, required this.time, required this.is_me}):super(key: key);
  final String text;
  final String time;
  final bool is_me;
  @override
  Widget build(BuildContext context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(
              top: 5,
              bottom: 5,
              right: 10
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
              color: kColorPrimary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft:is_me?Radius.circular(20):Radius.circular(0),
                  bottomRight: Radius.circular(0)
              )
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