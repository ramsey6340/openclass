import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email!, password: user.password!);
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("users").withConverter(
      fromFirestore: UserModel.fromFirestore,
      toFirestore: (UserModel user, options) => user.toFirestore(),
    ).doc(credential.user?.uid);
    docRef.set(user);
    docRef.update({"id": credential.user?.uid});
  }

  // methode de creation d'une classe dans Firebase
  Future<void> creationClassroom(Classroom classroom) async
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("classrooms").doc(classroom.responsible_id).collection(classroom.responsible_id!).withConverter(
        fromFirestore: Classroom.fromFirestore,
        toFirestore: (Classroom classroom, options) => classroom.toFirestore(),).doc();
    docRef.set(classroom);
    docRef.update({"id_classroom":docRef.id});
    current_classroom_id = docRef.id;
  }

  // methode de creation d'une categoie de salle dans Firebase
  Future<void> creationCategorySalle(CategorySalle categorySalle) async
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("categoriesSalles").doc(categorySalle.classroom_id).collection(categorySalle.classroom_id).withConverter(
      fromFirestore: CategorySalle.fromFirestore,
      toFirestore: (CategorySalle categorySalle, options) => categorySalle.toFirestore(),).doc();
    docRef.set(categorySalle);
    docRef.update({"id_category":docRef.id});
    current_categories_salle_id.add(docRef.id);
  }

  // methode de création d'une salle dans Firebase
  Future<void> creationSalle(Salle salle) async
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final docRef = db.collection("salles").doc(salle.category_salle_id).collection(salle.category_salle_id).withConverter(
      fromFirestore: Salle.fromFirestore,
      toFirestore: (Salle salle, options) => salle.toFirestore(),).doc();
    docRef.set(salle);
    docRef.update({"id_salle":docRef.id});
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
    docRef.update({"id_message": docRef.id});
  }

}