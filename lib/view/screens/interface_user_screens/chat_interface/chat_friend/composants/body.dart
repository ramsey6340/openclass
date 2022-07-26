import 'package:flutter/material.dart';
import '../../../../../composants/send_message_bar.dart';
import 'build_list_message.dart';

class Body extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        // liste des messages
        BuildListMessage(),
        // la barre d'envoie des messages
        SendMessageBar(),
      ],
    );
  }
}