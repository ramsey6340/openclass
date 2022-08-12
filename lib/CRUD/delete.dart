import 'package:cloud_firestore/cloud_firestore.dart';

class Delete 
{
  final db = FirebaseFirestore.instance;

  // methode de suppression d'une Classe
  void deleteClasse(String id_classroom)
  {
    db.collection("classrooms").doc(id_classroom).delete();
  }
  // methode de suppression d'une Categorie
  void deleteCategorie(String id_categorie)
  {
    db.collection("categoriesSalles").doc(id_categorie).delete();
  }
  // methode de suppresion d'une salle
  void deleteSalle(String id_salle)
  {
    db.collection("salles").doc(id_salle).delete();
  }
}