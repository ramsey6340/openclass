import 'package:flutter/material.dart';
import 'build_list_message.dart';
import 'send_message_bar.dart';

class ChatPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        // liste des messages
        Expanded(child: BuildListMessage()),
        // la barre d'envoie des messages
        SendMessageBar()
      ],
    );
  }
}