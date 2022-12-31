import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../../../data/data_current.dart';
import '../../../../../../model/message.dart';
import '../constante.dart';
import 'bubble.dart';
import 'loading.dart';

/// Cet Widget permet de lister les messages entre 2 utilisateurs ou les messages dans un groupe

class BuildListMessage extends StatefulWidget
{
  const BuildListMessage({Key? key}) : super(key: key);

  @override
  State<BuildListMessage> createState() => _BuildListMessageState();
}

class _BuildListMessageState extends State<BuildListMessage> {
  @override
  Widget build(BuildContext context) {

    // creation d'une instance pour ce connecté à Firestore
    FirebaseFirestore db = FirebaseFirestore.instance;
    // recuperation des messages
    final Stream<QuerySnapshot> _chatFriendStream  = db.collection("chats").doc(current_group_id).collection(current_group_id).orderBy("date_creation", descending: true).snapshots();

    return StreamBuilder(
      stream: _chatFriendStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Quelque chose s'est mal passé");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        return ListView.builder(
              reverse: true,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index){
                final item = Message.fromSnapshot(snapshot.data?.docs[index]);
                return (item.typeMessage == "text")?BubbleSpecialThree(
                  text: item.content!,
                  textStyle: const TextStyle(color: Colors.white),
                  isSender: (item.sender_id==current_user.id)?true:false,
                  color: (item.sender_id==current_user.id)?kColorPrimary:Colors.black38,
                  tail: true,
                  sent: true,
                ):
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ShowImage(imageUrl: item.content!))
                  ),
                  child: Bubble(
                    urlImage: item.content!,
                    isSender: (item.sender_id==current_user.id)?true:false,
                    color: (item.sender_id==current_user.id)?kColorPrimary:Colors.black38,
                    tail: true,
                    sent: true,
                  ),
                );
              },
            )
        ;
      },
    );
  }
}

// widget pour récuperer une image depuis notre base de donnée distant
class ShowImage extends StatelessWidget {
  const ShowImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.network(imageUrl),
    );
  }
}


