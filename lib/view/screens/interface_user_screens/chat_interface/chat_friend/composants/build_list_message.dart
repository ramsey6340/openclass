/*
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
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('messages')
              .document(groupChatId)
              .collection(groupChatId)
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Loading();
            } else {
              listMessage = snapshot.data.documents;
              return ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemBuilder: (context, index) => ChatBubble(text: snapshot.data?.documents[index], time: '', is_me: true),
                itemCount: snapshot.data.documents.length,
                reverse: true,
                controller: listScrollController,
              );
            }
          },
        ),,
      ),
    );
  }
}

 */
