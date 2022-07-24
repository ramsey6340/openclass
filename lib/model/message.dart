import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';

class Message
{
  UserModel? sender;
  UserModel? receiver;
  String? date_creation;
  String? content;
  String? url_image;

  Message(
      {this.sender,
      this.receiver,
      this.date_creation,
      this.content,
      this.url_image});

  // les getters
  UserModel? get senderM => this.sender;
  UserModel? get receiverM => this.receiver;
  String ? get dateCreation => this.date_creation;
  String? get contentM => this.content;
  String? get urlImage => this.url_image;

  // les setters
  set senderM(UserModel? value){
    sender = value;
  }
  set receiverM(UserModel? value){
    receiver = value;
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
      sender: data?['sender'],
      receiver: data?['receiver'],
      date_creation: data?['date_creation'],
      content: data?['content'],
      url_image: data?['url_image'],
    );
  }

  // convertir la classe UserModel en map
  Map<String, dynamic> toFirestore() {
    return {
      if (sender != null) "sender": sender,
      if (receiver != null) "receiver": receiver,
      if (date_creation != null) "date_creation": date_creation,
      if (content != null) "content": content,
      if (url_image != null) "url_image": url_image,
    };
  }

}