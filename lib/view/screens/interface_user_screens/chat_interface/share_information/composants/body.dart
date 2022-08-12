import 'package:flutter/material.dart';
import 'package:openclass/data/data_current.dart';
import '../../../../../composants/build_list_message.dart';
import 'send_message_bar.dart';

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
        (current_classroom.responsible_id == current_user.id)?SendMessageBar():Container(),
      ],
    );
  }
}