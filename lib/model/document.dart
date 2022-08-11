import 'package:cloud_firestore/cloud_firestore.dart';

import 'my_action.dart';
/*
class Document extends MyAction
{

  // les constructeurs
  Document(
      String id_doc,
      String salle_doc_id,
      String user_doc_name,
      {
        String? content_doc,
        String? publication_date,
        String? name_classroom
      }):super(id_doc, salle_doc_id, user_doc_name,content_action: content_doc, publication_date: publication_date, name_classroom: name_classroom);

  // les getters
  String get idDoc => super.id_action;
  String? get contentDoc => super.content_action;
  String? get publicationDateDoc => super.publication_date;
  String get salleDocId => super.salle_action_id;
  String get userDocName => super.user_action_name;
  String? get nameClassroom => super.name_classroom;

  // les setters
  @override
  set idDoc(String value){
    super.id_action = value;
  }
  @override
  set contentDoc(String? value){
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
  set salleDocId(String value){
    super.salle_action_id;
  }
  @override
  set userDocName(String value){
    super.user_action_name = value;
  }

  // convertir la map en classe Information
  factory Document.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Document(
      data?['id_doc'],
      data?['salle_doc_id'],
      data?['user_doc_name'],
      content_doc: data?['content_doc'],
      publication_date: data?['publication_date'],
      name_classroom: data?['name_classroom'],
    );
  }

  // convertir un DocumentSnapshot en classe Information
  factory Document.fromSnapshot(
      DocumentSnapshot? snapshot) {
    final data = snapshot?.data() as Map<String, dynamic>;
    return Document(
      data['id_doc'],
      data['salle_doc_id'],
      data['user_info_name'],
      content_doc: data['content_doc'],
      publication_date: data['publication_date'],
      name_classroom: data['name_classroom'],
    );
  }

  // convertir la classe Information en map
  Map<String, dynamic> toFirestore() {
    return {
      if (idDoc != null) "id_info": idDoc,
      if (salleDocId != null) "salle_info_id": salleDocId,
      if (userDocName != null) "user_info_name": userActionName,
      if (contentDoc != null) "content_info": contentDoc,
      if (publicationDateDoc != null) "publication_date": publicationDateDoc,
      if (nameClassroom != null) "name_classroom": nameClassroom,
    };
  }
 */
//}
