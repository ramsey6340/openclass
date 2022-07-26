import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';

class Message
{
  String? sender_id;
  String? receiver_id;
  String? date_creation;
  String? content;
  String? url_image;

  Message(
      {this.sender_id,
      this.receiver_id,
      this.date_creation,
      this.content,
      this.url_image});

  // les getters
  String? get senderId => this.sender_id;
  String? get receiverId => this.receiver_id;
  String ? get dateCreation => this.date_creation;
  String? get contentM => this.content;
  String? get urlImage => this.url_image;

  // les setters
  set senderM(String? value){
    sender_id = value;
  }
  set receiverM(String? value){
    receiver_id = value;
  }
  set dateCreation(String? value){
    date_creation = value;
  }
  set contentM(String? value){
    content = value;
  }
  set urlImage(String? value){
    url_image = value;
  }

  // convertir la map en classe UserModel
  factory Message.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Message(
      sender_id: data?['sender'],
      receiver_id: data?['receiver'],
      date_creation: data?['date_creation'],
      content: data?['content'],
      url_image: data?['url_image'],
    );
  }

  // convertir la classe UserModel en map
  Map<String, dynamic> toFirestore() {
    return {
      if (sender_id != null) "sender": sender_id,
      if (receiver_id != null) "receiver": receiver_id,
      if (date_creation != null) "date_creation": date_creation,
      if (content != null) "content": content,
      if (url_image != null) "url_image": url_image,
    };
  }

}