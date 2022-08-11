import 'package:cloud_firestore/cloud_firestore.dart';

import 'my_action.dart';
/*
class Discussion extends MyAction
{
  // les constructeurs
  Discussion(
      String id_disc,
      String salle_disc_id,
      String user_disc_name,
      {
        String? content_disc,
        String? publication_date,
        String? name_classroom
      }):super(id_disc, salle_disc_id, user_disc_name,content_action: content_disc, publication_date: publication_date, name_classroom: name_classroom);

  // les getters
  String get idDisc => super.id_action;
  String? get contentDisc => super.content_action;
  String? get publicationDateDisc => super.publication_date;
  String get salleDiscId => super.salle_action_id;
  String get userDiscName => super.user_action_name;
  String? get nameClassroom => super.name_classroom;

  // les setters
  @override
  set idDisc(String value){
    super.id_action = value;
  }
  @override
  set contentDisc(String? value){
    super.content_action = value;
  }
  @override
  set publicationDate(String? value){
    super.publicationDate = value;
  }
  @override
  set nameClassroom(String? value){
    super.name_classroom = value;
  }
  @override
  set salleDiscId(String value){
    super.salle_action_id;
  }
  @override
  set userDiscName(String value){
    super.user_action_name = value;
  }

  // convertir la map en classe Information
  factory Discussion.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Discussion(
      data?['id_disc'],
      data?['salle_disc_id'],
      data?['user_disc_name'],
      content_disc: data?['content_disc'],
      publication_date: data?['publication_date'],
      name_classroom: data?['name_classroom'],
    );
  }

  // convertir un DocumentSnapshot en classe Information
  factory Discussion.fromSnapshot(
      DocumentSnapshot? snapshot) {
    final data = snapshot?.data() as Map<String, dynamic>;
    return Discussion(
      data['id_disc'],
      data['salle_disc_id'],
      data['user_disc_name'],
      content_disc: data['content_disc'],
      publication_date: data['publication_date'],
      name_classroom: data['name_classroom'],
    );
  }

  // convertir la classe Information en map
  Map<String, dynamic> toFirestore() {
    return {
      if (idDisc != null) "id_disc": idDisc,
      if (salleDiscId != null) "salle_disc_id": salleDiscId,
      if (userDiscName != null) "user_disc_name": userDiscName,
      if (contentDisc != null) "content_disc": contentDisc,
      if (publicationDateDisc != null) "publication_date": publicationDateDisc,
      if (nameClassroom != null) "name_classroom": nameClassroom,
    };
  }

 */

//}