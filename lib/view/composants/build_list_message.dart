import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../../../data/data_current.dart';
import '../../../../../../model/message.dart';
import '../constante.dart';
import 'chat_bubble.dart';
import 'loading.dart';

class BuildListMessage extends StatefulWidget
{
  @override
  State<BuildListMessage> createState() => _BuildListMessageState();
}

class _BuildListMessageState extends State<BuildListMessage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final Stream<QuerySnapshot> _chatFriendStream  = db.collection("chats").doc(current_group_id).collection(current_group_id).snapshots();
    return StreamBuilder(
      stream: _chatFriendStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Quelque chose s'est mal passé");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        return Expanded(
          child: Container(
            color: kColorSecondary,
            child: ListView.builder(
              reverse: true,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index){
                final item = Message.fromSnapshot(snapshot.data?.docs[index]);
                return ChatBubble(text: item.content!, time: item.date_creation!, is_me: (item.sender_id==current_user.id)?true:false);
              },
            ),
          ),
        );
      },
    );
  }
}