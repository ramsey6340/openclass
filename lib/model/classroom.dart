import 'package:cloud_firestore/cloud_firestore.dart';

class Classroom
{
  final String id_classroom;
  String? name_classroom;
  String? img_profile;
  String? creation_date;
  String? description_classroom;
  bool? is_private;
  String? responsible_id;

  Classroom(
      this.id_classroom,
      {
      this.name_classroom,
      this.img_profile,
      this.creation_date,
      this.description_classroom,
      this.is_private,
      this.responsible_id});

  //les accesseurs
  String get idClassroom => id_classroom;
  String? get nameClassroom => name_classroom;
  String? get imgProfile => img_profile;
  String? get creationDate => creation_date;
  String? get descriptionClassroom => description_classroom;
  bool? get isPrivate => is_private;
  String? get responsibleId => responsible_id;

  // les mutateurs
  set name(String? value){
    name_classroom = value;
  }
  set image(String? value){
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
  set responsibleId(String? value){
    responsible_id = value;
  }

  // convertir la map en classe Classroom
  factory Classroom.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Classroom(
      data?['id_classroom'],
      name_classroom: data?['name_classroom'],
      img_profile: data?['img_profile'],
      creation_date: data?['creation_date'],
      is_private: data?['is_private'],
      description_classroom: data?['description_classroom'],
      responsible_id: data?['responsible_id'],
    );
  }

  // convertir un DocumentSnapshot en classe Classroom
  factory Classroom.fromSnapshot(
      DocumentSnapshot? snapshot) {
    final data = snapshot?.data() as Map<String, dynamic>;
    return Classroom(
      data['id_classroom'],
      name_classroom: data['name_classroom'],
      img_profile: data['img_profile'],
      creation_date: data['creation_date'],
      is_private: data['is_private'],
      description_classroom: data['description_classroom'],
      responsible_id: data['responsible_id'],
    );
  }

  // convertir la classe Classroom en map
  Map<String, dynamic> toFirestore() {
    return {
      if (id_classroom != null) "id_classroom": id_classroom,
      if (name_classroom != null) "name_classroom": name_classroom,
      if (img_profile != null) "img_profile": img_profile,
      if (creation_date != null) "creation_date": creation_date,
      if (description_classroom != null) "description_classroom": description_classroom,
      if (is_private != null) "is_private": is_private,
      if (responsible_id != null) "responsible_id": responsible_id,
    };
  }

}