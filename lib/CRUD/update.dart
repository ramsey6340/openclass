import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:openclass/data/data_current.dart';

class Update
{
  // methode de mise à jour de l'utilisateur
  Future<void> updateUserProfile(Map<String, dynamic> new_value) async
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("users").doc(current_user.id);
    docRef.update(new_value);
  }

  // methode de mise à jour de la classe
  Future<void> updateClassroom(Map<String, dynamic> new_value) async
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("classrooms").doc(current_classroom.responsible_id).collection(current_classroom.responsible_id).doc(current_classroom.id_classroom);
    docRef.update(new_value);
  }

  // methode de mise à jour de la catégorie
  Future<void> updateCategorySalle(Map<String, dynamic> new_value) async
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("categoriesSalles").doc(current_classroom.id_classroom).collection(current_classroom.id_classroom).doc(current_category.id_category);
    docRef.update(new_value);
  }

  // methode de mise à jour de la salle
  Future<void> updateSalle(Map<String, dynamic> new_value) async
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    //final docRef = db.collection("salles").doc(current_category.id_category).collection(current_category.id_category).doc(current_salle.id_salle);
    final docRef = db.collection("salles").doc(current_salle.id_salle);
    docRef.update(new_value);
  }
}