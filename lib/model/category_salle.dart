import 'package:cloud_firestore/cloud_firestore.dart';
import 'enum_type.dart';

class CategorySalle
{
  String id_category;
  String? name_category;
  String? creation_date;
  String? description_category;
  bool? is_private;
  String? type_category;
  String classroom_id;

  CategorySalle(
      this.id_category,
      this.classroom_id,
      {
      this.name_category,
      this.creation_date,
      this.description_category,
      this.is_private,
      this.type_category,
      });


  // les getters
  String get idCategory => id_category;
  String? get nameCategory => name_category;
  String? get creationDate => creation_date;
  String? get descriptionCategory => description_category;
  bool? get isPrivate => is_private;
  String? get typeCategory => type_category;
  String get classroomId => classroom_id;
  //les setters
  set idCategory(String value){
    id_category = value;
  }
  set nameCategory(String? value){
    name_category = value;
  }
  set creationDate(String? value){
    creation_date = value;
  }
  set descriptionCategory(String? value){
    description_category = value;
  }
  set isPrivate(bool? value){
    is_private = value;
  }
  set typeCategory(String? value){
    type_category = value;
  }
  set classroomId(String value){
    classroom_id = value;
  }


  // convertir la map en classe CategorySalle
  factory CategorySalle.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return CategorySalle(
      data?['id_category'],
      data?['classroom_id'],
      name_category: data?['name_category'],
      creation_date: data?['creation_date'],
      description_category: data?['description_category'],
      is_private: data?['is_private'],
      type_category: data?['type_category'],
    );
  }

  // convertir un DocumentSnapshot en classe CategorySalle
  factory CategorySalle.fromSnapshot(DocumentSnapshot? snapshot) {
    final data = snapshot?.data() as Map<String, dynamic>;
    return CategorySalle(
      data['id_category'],
      data['classroom_id'],
      name_category: data['name_category'],
      creation_date: data['creation_date'],
      description_category: data['description_category'],
      is_private: data['is_private'],
      type_category: data['type_category'],
    );
  }

  // convertir la classe CategorySalle en map
  Map<String, dynamic> toFirestore() {
    return {
      if (id_category != null) "id_category": id_category,
      if (name_category != null) "name_category": name_category,
      if (creation_date != null) "creation_date": creation_date,
      if (description_category != null) "description_category": description_category,
      if (is_private != null) "is_private": is_private,
      if (type_category != null) "type_category": type_category,
      if (classroom_id != null) "classroom_id": classroom_id,
    };
  }
  //les methodes
  /*

   void add(MyModel model) {
    modelsList.add(model);
    notifyListeners();
  }

  void removeAt(int index) {
    modelsList.removeAt(index);
    notifyListeners();
  }

  void editModelNumber(int index,int newModelNumber){
    modelsList[index].edit(newModelNumber);
    notifyListeners();
  }

   */
}