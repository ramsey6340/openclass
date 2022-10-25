import 'package:cloud_firestore/cloud_firestore.dart';

class Classroom
{
  String id_classroom;
  bool hidden = false;
  String name_classroom;
  String img_profile;
  String? creation_date;
  String? description_classroom;
  bool? is_private;
  String responsible_id;
  List<String>? membres;

  Classroom(
      this.id_classroom,
      this.hidden,
      this.responsible_id,
      this.img_profile,
      this.name_classroom,
      {
      this.membres,
      this.creation_date,
      this.description_classroom,
      this.is_private,});

  //les accesseurs
  String get idClassroom => id_classroom;
  bool get hiddenClassroom => hidden;
  String get nameClassroom => name_classroom;
  String get imgProfile => img_profile;
  String? get creationDate => creation_date;
  String? get descriptionClassroom => description_classroom;
  bool? get isPrivate => is_private;
  String get responsibleId => responsible_id;
  List<String>? get membresClassroom => membres;

  // les mutateurs
  set idClassroom(String value){
    id_classroom = value;
  }
  set hiddenClassroom(bool value){
    hidden = value;
  }
  set name(String value){
    name_classroom = value;
  }
  set image(String value){
    img_profile = value;
  }
  set creationDate(String? value){
    creation_date = value;
  }
  set descriptionClassroom(String? value){
    description_classroom = value;
  }
  set isPrivate(bool? value){
    is_private = value;
  }
  set responsibleId(String value){
    responsible_id = value;
  }
  set membresClassroom(List<String>? value){
    membres = value;
  }

  // convertir la map en classe Classroom
  factory Classroom.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Classroom(
      data?['id_classroom'],
      data?['hidden'],
      data?['responsible_id'],
      data?['img_profile'],
      data?['name_classroom'],
      creation_date: data?['creation_date'],
      is_private: data?['is_private'],
      description_classroom: data?['description_classroom'],
      membres: data?['membres'] is Iterable? List.from(data?['membres']) : null,
    );
  }

  // convertir un DocumentSnapshot en classe Classroom
  factory Classroom.fromSnapshot(
      DocumentSnapshot? snapshot) {
    final data = snapshot?.data() as Map<String, dynamic>;
    return Classroom(
      data['id_classroom'],
      data['hidden'],
      data['responsible_id'],
      data['img_profile'],
      data['name_classroom'],
      creation_date: data['creation_date'],
      is_private: data['is_private'],
      description_classroom: data['description_classroom'],
      membres: data['membres'] is Iterable? List.from(data['membres']) : null,
    );
  }

  // convertir la classe Classroom en map
  Map<String, dynamic> toFirestore() {
    return {
      if (id_classroom != null) "id_classroom": id_classroom,
      if (hidden != null) "hidden": hidden,
      if (name_classroom != null) "name_classroom": name_classroom,
      if (img_profile != null) "img_profile": img_profile,
      if (creation_date != null) "creation_date": creation_date,
      if (description_classroom != null) "description_classroom": description_classroom,
      if (is_private != null) "is_private": is_private,
      if (responsible_id != null) "responsible_id": responsible_id,
      if(membres != null) "membres": membres,
    };
  }

}