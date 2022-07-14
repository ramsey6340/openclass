import 'package:flutter/material.dart';

import '../../../../../../data/data_message.dart';
import '../../../../../composants/chat_bubble.dart';
import '../../../../../composants/send_message_bar.dart';
import '../../../../../constante.dart';

class Body extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: kColorSecondary,
            child: ListView.builder(
              reverse: true,
              itemCount: data_list_messages.length,
              itemBuilder: (context, index){
                final item = data_list_messages[index];
                return ChatBubble(text: item.text, time: item.time, is_me: true);
              },
            ),
          ),
        ),
        SendMessageBar(),
      ],
    );
  }
}