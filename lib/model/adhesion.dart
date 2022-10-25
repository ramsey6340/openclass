import 'package:cloud_firestore/cloud_firestore.dart';

class Adhesion
{
  // les attribues
  String id_adhesion;
  String? adhesion_date;
  String? adhesion_type;
  bool? receive_notification;
  String classroom_id;
  String user_id;

  //les contructeurs
  Adhesion(
      this.id_adhesion,
      this.classroom_id,
      this.user_id,
      {
      this.adhesion_date,
      this.adhesion_type,
      this.receive_notification,
      });

  // getters
  String get idAdhesion => id_adhesion;
  String? get dateAdhesion => adhesion_date;
  String? get typeAdhesion => adhesion_type;
  bool? get receiveNotification => receive_notification;
  String get classroomId => classroom_id;
  String get userId => user_id;

  // setters
  set idAdhesion(String value){
    id_adhesion = value;
  }
  set adhesionDate(String? value){
    adhesion_date = value;
  }
  set adhesionType(String? value){
    adhesion_type = value;
  }
  set receiveNotification(bool? value){
    receive_notification = value;
  }
  set classroomId(String value){
    classroom_id = value;
  }
  set userId(String value){
    user_id = value;
  }

  // convertir la map en classe Adhesion
  factory Adhesion.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Adhesion(
      data?['id_adhesion'],
      data?['classroom_id'],
      data?['user_id'],
      adhesion_date: data?['adhesion_date'],
      adhesion_type: data?['adhesion_type'],
      receive_notification: data?['receive_notification'],
    );
  }

  // convertir un DocumentSnapshot en classe Adhesion
  factory Adhesion.fromSnapshot(
      DocumentSnapshot? snapshot) {
    final data = snapshot?.data() as Map<String, dynamic>;
    return Adhesion(
      data['id_adhesion'],
      data['classroom_id'],
      data['user_id'],
      adhesion_date: data['adhesion_date'],
      adhesion_type: data['adhesion_type'],
      receive_notification: data['receive_notification'],
    );
  }

  // convertir la class Adhesion en map
  Map<String, dynamic> toFirestore() {
    return {
      if (id_adhesion != null) "id_adhesion": id_adhesion,
      if (classroom_id != null) "classroom_id": classroom_id,
      if (user_id != null) "user_id": user_id,
      if (adhesion_date != null) "adhesion_date": adhesion_date,
      if (adhesion_type != null) "adhesion_type": adhesion_type,
      if (receive_notification != null) "receive_notification": receive_notification,
    };
  }

}