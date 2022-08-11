import 'dart:io';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openclass/CRUD/create.dart';
import 'package:openclass/model/message.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../data/data_current.dart';
import '../../../../../constante.dart';

class SendMessageBar extends StatelessWidget
{
  TextEditingController messageController = TextEditingController();
  Create create = Create();
  File? imageFile;
  File? docFile;
  @override
  Widget build(BuildContext context)
  {
    return MessageBar(
      onSend: (new_message) {
        print(new_message);
        final message = Message(
          sender_id: current_user.id,
          receiver_id: current_peer_id,
          date_creation: DateTime.now().toString(),
          content: new_message,
          type_message: "text",
          url_image: '',
        );
        create.creationMessage(message);
      },
      sendButtonColor: kColorPrimary,
      messageBarColor: kColorAppBar,
      actions: [
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: InkWell(
            child: Icon(
              Icons.photo,
              color: Colors.grey,
              size: 24,
            ),
            onTap: () {
              getImage();
            },
          ),
        ),
      ],
    );
  }

  // recuperation de l'image
  Future<void> getImage() async{
    ImagePicker picker = ImagePicker();
    picker.pickImage(source: ImageSource.gallery).then((value) {
      if(value != null){
        imageFile = File(value.path);
        uploadImage();
      }
    });
  }

  // uploader l'image dans cloud Storage
  Future<void> uploadImage() async{
    String image_name = Uuid().v1();
    final storage = FirebaseStorage.instance;
    final ref = storage.ref(current_user_id).child("images").child('$image_name.jpg');
    final uploadTask = await ref.putFile(imageFile!);
    String image_url = await uploadTask.ref.getDownloadURL();

    final message = Message(
      sender_id: current_user.id,
      receiver_id: current_peer_id,
      date_creation: DateTime.now().toString(),
      content: image_url,
      type_message: "file",
      url_image: '',
    );
    create.creationMessage(message);

    print(image_url);
  }

}