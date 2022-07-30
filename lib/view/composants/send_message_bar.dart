import 'package:flutter/material.dart';
import 'package:openclass/CRUD/create.dart';
import 'package:openclass/model/message.dart';

import '../../data/data_current.dart';
import '../constante.dart';

class SendMessageBar extends StatelessWidget
{
  TextEditingController messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Create create = Create();
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
      final message = Message(
        sender_id: current_user.id,
        receiver_id: current_peer_id,
        date_creation: '',
        content: messageController.text,
        url_image: '',
      );
      create.creationMessage(message);
  }
}