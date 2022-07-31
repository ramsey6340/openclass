import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openclass/CRUD/read.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/model/classroom.dart';
import 'package:openclass/model/message.dart';
import 'package:openclass/model/user.dart';
import '../model/salle.dart';

class Create
{
  // methode d'enregistrement de l'utilisateur dans Firebase lors de la première inscription
  Future<void> signUpUserInFirebase(UserModel user) async
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("users").withConverter(
      fromFirestore: UserModel.fromFirestore,
      toFirestore: (UserModel user, options) => user.toFirestore(),
    ).doc(user.id);
    docRef.set(user);
    /*
    final docUpdateRef = db.collection("users").doc(credential.user?.uid);
    docUpdateRef.update({"id": docUpdateRef.id});
     */
  }

  // methode de creation d'une classe dans Firebase
  Future<void> creationClassroom(Classroom classroom) async
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("classrooms").doc(classroom.responsible_id).collection(classroom.responsible_id).withConverter(
        fromFirestore: Classroom.fromFirestore,
        toFirestore: (Classroom classroom, options) => classroom.toFirestore(),
    ).doc(classroom.id_classroom);
    docRef.set(classroom);
    /*
    final docUpdateRef = db.collection("classrooms").doc(classroom.responsible_id).collection(classroom.responsible_id).doc(docRef.id);
    docUpdateRef.update({"id_classroom":docRef.id});
     */
    current_classroom_id = classroom.id_classroom;
  }

  // methode de creation d'une categoie de salle dans Firebase
  Future<void> creationCategorySalle(CategorySalle categorySalle) async
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("categoriesSalles").doc(categorySalle.classroom_id).collection(categorySalle.classroom_id).withConverter(
      fromFirestore: CategorySalle.fromFirestore,
      toFirestore: (CategorySalle categorySalle, options) => categorySalle.toFirestore(),
    ).doc(categorySalle.id_category);
    docRef.set(categorySalle);
    /*
    final docUpdateRef = db.collection("categoriesSalles").doc(categorySalle.classroom_id).collection(categorySalle.classroom_id).doc(docRef.id);
    docUpdateRef.update({"id_category":docUpdateRef.id});
     */
    current_categories_salle_id.add(categorySalle.id_category);

  }

  // methode de création d'une salle dans Firebase
  Future<void> creationSalle(Salle salle) async
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("salles").doc(salle.category_salle_id).collection(salle.category_salle_id).withConverter(
      fromFirestore: Salle.fromFirestore,
      toFirestore: (Salle salle, options) => salle.toFirestore(),
    ).doc(salle.id_salle);
    docRef.set(salle);
    /*
    final docUpdateRef = db.collection("salles").doc(salle.category_salle_id).collection(salle.category_salle_id).doc(docRef.id);
    docUpdateRef.update({"id_salle":docUpdateRef.id});

     */
  }

  // methode de création d'un message dans Firebase
  Future<void> creationMessage(Message message) async
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("chats").doc(current_group_id).collection(current_group_id).withConverter(
        fromFirestore: Message.fromFirestore,
        toFirestore: (Message message, options) => message.toFirestore(),
    ).doc();
    docRef.set(message);
    final docUpdateRef = db.collection("chats").doc(current_group_id).collection(current_group_id).doc(docRef.id);
    docUpdateRef.update({"id_message": docUpdateRef.id});
  }

}