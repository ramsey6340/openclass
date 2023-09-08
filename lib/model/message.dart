import 'package:cloud_firestore/cloud_firestore.dart';


class Message
{
  String? id_message;
  String? sender_id;
  String? receiver_id;
  String? date_creation;
  String? content;
  String? type_message;
  String? url_image;

  Message(
      {this.id_message,
      this.sender_id,
      this.receiver_id,
      this.date_creation,
      this.content,
      this.type_message,
      this.url_image});

  // les getters
  String? get idMessage => this.id_message;
  String? get senderId => this.sender_id;
  String? get receiverId => this.receiver_id;
  String ? get dateCreation => this.date_creation;
  String? get contentM => this.content;
  String? get typeMessage => this.type_message;
  String? get urlImage => this.url_image;

  // les setters
  set idMessage(String? value){
    id_message = value;
  }
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
  set typeMessage(String? value){
    type_message = value;
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
      id_message: data?['id_massage'],
      sender_id: data?['sender'],
      receiver_id: data?['receiver'],
      date_creation: data?['date_creation'],
      content: data?['content'],
      type_message: data?['type_message'],
      url_image: data?['url_image'],
    );
  }

  // convertir un DocumentSnapshot en classe UserModel
  factory Message.fromSnapshot(DocumentSnapshot? snapshot) {
    final data = snapshot?.data() as Map<String, dynamic>;
    return Message(
      id_message: data['id_message'],
      sender_id: data['sender'],
      receiver_id: data['receiver'],
      date_creation: data['date_creation'],
      content: data['content'],
      type_message: data['type_message'],
      url_image: data['url_image'],
    );
  }

  // convertir la classe UserModel en map
  Map<String, dynamic> toFirestore() {
    return {
      if (id_message != null) "id_message": id_message,
      if (sender_id != null) "sender": sender_id,
      if (receiver_id != null) "receiver": receiver_id,
      if (date_creation != null) "date_creation": date_creation,
      if (content != null) "content": content,
      if(type_message != null) "type_message":type_message,
      if (url_image != null) "url_image": url_image,
    };
  }

}