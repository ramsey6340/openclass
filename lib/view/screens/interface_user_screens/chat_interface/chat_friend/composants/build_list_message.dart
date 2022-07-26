import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/chat_interface/chat_friend/composants/loading.dart';
import '../../../../../../data/data_message.dart';
import '../../../../../composants/chat_bubble.dart';
import '../../../../../constante.dart';

class BuildListMessage extends StatelessWidget {
  const BuildListMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String groupChatId = '';
    return Expanded(
      child: Container(
        color: kColorSecondary,
        child: ListView.builder(
          reverse: true,
          itemCount: data_list_messages.length,
          itemBuilder: (context, index){
            final item = data_list_messages[index];
            return ChatBubble(text: item.content!, time: item.date_creation!, is_me: true);
          },
        ),
      ),
    );
  }
}