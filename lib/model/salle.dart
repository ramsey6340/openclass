import 'package:cloud_firestore/cloud_firestore.dart';

import 'category_salle.dart';

class Salle
{
  String? id_salle;
  String? name_salle;
  String? creation_date;
  bool? is_private;
  String? category_salle_id;

  Salle(
      {this.id_salle,
      this.name_salle,
      this.creation_date,
      this.is_private,
      this.category_salle_id});

  // Les accesseurs
  String? get idSalle => id_salle;
  String? get nameSalle => name_salle;
  String? get creationDate => creation_date;
  bool? get isPrivate => is_private;
  String? get categorySalleId => category_salle_id;
  // Les mutateurs
  set idSalle(String? value){
    id_salle = value;
  }
  set nameSalle(String? value){
    name_salle = value;
  }
  set creationDate(String? value){
    creation_date = value;
  }
  set isPrivate(bool? value){
    is_private = value;
  }
  set categorySalleId(String? value){
    category_salle_id = value;
  }

  // convertir la map en classe Salle
  factory Salle.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Salle(
      id_salle: data?['id_salle'],
      name_salle: data?['name_salle'],
      creation_date: data?['creation_date'],
      is_private: data?['is_private'],
      category_salle_id: data?['category_salle_id'],
    );
  }

  // convertir la classe Salle en map
  Map<String, dynamic> toFirestore() {
    return {
      if (id_salle != null) "id_salle": id_salle,
      if (name_salle != null) "name_salle": name_salle,
      if (creation_date != null) "creation_date": creation_date,
      if (is_private != null) "is_private": is_private,
      if (category_salle_id != null) "category_salle_id": category_salle_id,
    };
  }

}