import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:openclass/model/user.dart';
import '../data/data_user.dart';

class Read
{
  Future<UserModel> initCurrentUser(String? docId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final ref = db.collection("users").doc(docId).withConverter(
      fromFirestore: UserModel.fromFirestore,
      toFirestore: (UserModel user, _) => user.toFirestore(),
    );
    final docSnap = await ref.get();

    currentUser = docSnap.data()!; // Convert to City object
    return currentUser;
  }
}