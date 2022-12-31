import 'package:flutter/material.dart';
import 'build_list_message.dart';
import 'send_message_bar.dart';

/// Widget qui représente la page de chat en elle même
/// Il contient les messages et la barre pour taper et envoyer les messages

class ChatPage extends StatelessWidget
{
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        // liste des messages
        const Expanded(child: BuildListMessage()),
        // la barre d'envoie des messages
        SendMessageBar()
      ],
    );
  }
}