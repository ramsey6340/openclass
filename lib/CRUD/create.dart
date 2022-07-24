import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:openclass/model/user.dart';

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
}