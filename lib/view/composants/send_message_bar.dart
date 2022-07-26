import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/data/data_user.dart';
import 'package:openclass/model/message.dart';

import '../../data/data_current_classroom.dart';
import '../constante.dart';

class SendMessageBar extends StatelessWidget
{
  TextEditingController messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: kColorAppBar,
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.image, size: 30, color: Colors.grey,)),
          Expanded(
            child: Container(
              height: 40,
              child: TextField(
                key: _formKey,
                controller: messageController,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(color: Colors.grey,),
                  filled: true,
                  fillColor: kColorComposant,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: registerMessage,
              icon: Icon(Icons.send, size: 30, color: kColorPrimary,)
          ),
        ],
      ),
    );
  }

  // methode pour envoyer le message sur Firebase
  void registerMessage()
  {
    final formState = _formKey.currentState;
    //if(formState!.validate()){
      // creation d'une instance de massage
      final message = Message(
        sender_id: currentUser.id,
        receiver_id: 'data_current_friend.id',
        date_creation: '',
        content: messageController.text,
        url_image: '',
      );
      FirebaseFirestore db = FirebaseFirestore.instance;
      String group_id = 'currentUser.id!+-'+data_current_friend.id!;
      // creation d'une reference pour le document
      final docRef = db.collection("chats").doc(group_id).collection(group_id).withConverter(
        fromFirestore: Message.fromFirestore,
        toFirestore: (Message message, options) => message.toFirestore(),
      ).doc(currentUser.id);

      // enregistrement des données dans le document
      docRef.set(message);
   // }
  }
}