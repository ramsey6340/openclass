import 'package:cloud_firestore/cloud_firestore.dart';

import 'my_action.dart';
class Information extends MyAction
{
  // les constructeurs
  Information(
      String id_info,
      String salle_info_id,
      String user_info_name,
      String id_classroom,
      {
        String? content_info,
        String? publication_date,
        String? name_classroom
      }):super(id_info, salle_info_id, user_info_name, id_classroom, content_action: content_info, publication_date: publication_date, name_classroom: name_classroom);

  // les getters
  String get idInfo => super.id_action;
  String? get contentInfo => super.content_action;
  String? get publicationDateInfo => super.publication_date;
  String get salleInfoId => super.salle_action_id;
  String get userInfoName => super.user_action_name;
  String? get nameClassroom => super.name_classroom;
  String get idClassroom => super.id_classroom;

  // les setters
  @override
  set idInfo(String value){
    super.id_action = value;
  }
  @override
  set contentInfo(String? value){
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
  set salleInfoId(String value){
  super.salle_action_id;
  }
  @override
  set userInfoName(String value){
    super.user_action_name = value;
  }
  @override
  set idClassroom(String value){
    super.id_classroom = value;
  }

  // convertir la map en classe Information
  factory Information.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Information(
      data?['id_info'],
      data?['salle_info_id'],
      data?['user_info_name'],
      data?['id_classroom'],
      content_info: data?['content_info'],
      publication_date: data?['publication_date'],
      name_classroom: data?['name_classroom'],
    );
  }

  // convertir un DocumentSnapshot en classe Information
  factory Information.fromSnapshot(
      DocumentSnapshot? snapshot) {
    final data = snapshot?.data() as Map<String, dynamic>;
    return Information(
      data['id_info'],
      data['salle_info_id'],
      data['user_info_name'],
      data['id_classroom'],
      content_info: data['content_info'],
      publication_date: data['publication_date'],
      name_classroom: data['name_classroom'],
    );
  }

  // convertir la classe Information en map
  Map<String, dynamic> toFirestore() {
    return {
      if (idInfo != null) "id_info": idInfo,
      if (salleInfoId != null) "salle_info_id": salleInfoId,
      if (userInfoName != null) "user_info_name": userInfoName,
      if(idClassroom != null) "id_classroom": idClassroom,
      if (contentInfo != null) "content_info": contentInfo,
      if (publicationDateInfo != null) "publication_date": publicationDateInfo,
      if (nameClassroom != null) "name_classroom": nameClassroom,
    };
  }

}