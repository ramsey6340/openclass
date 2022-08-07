import 'dart:io';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:openclass/CRUD/create.dart';
import 'package:openclass/model/message.dart';
import 'package:uuid/uuid.dart';

import '../../data/data_current.dart';
import '../constante.dart';

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
        InkWell(
          child: Icon(
            Icons.add,
            color: kColorPrimary,
            size: 24,
          ),
          onTap: () {
            getDocument();
          },
        ),
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

  // recuperation du document
  Future<void> getDocument() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc','xlsx'],
    );
    if (result != null) {
      docFile = File(result.files.single.path!);

      uploadDocument();
    } else {
      // L'utilisateur a annulé le sélecteur
    }
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

  // uploader le document dans cloud Storage
  Future<void> uploadDocument() async{
    String doc_name = Uuid().v1();
    final storage = FirebaseStorage.instance;
    final ref = storage.ref(current_user_id).child("document").child('$doc_name.pdf');
    final uploadTask = await ref.putFile(docFile!);
    String doc_url = await uploadTask.ref.getDownloadURL();
    final message = Message(
      sender_id: current_user.id,
      receiver_id: current_peer_id,
      date_creation: DateTime.now().toString(),
      content: doc_url,
      type_message: "file",
      url_image: '',
    );
    create.creationMessage(message);

    print(doc_url);

  }
}