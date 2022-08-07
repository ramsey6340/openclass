import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:openclass/controller/user_ctrl.dart';
import 'package:openclass/model/user.dart';
import '../data/data_current.dart';

class Read
{
  Future<void> initCurrentUser(String? currentId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final ref = db.collection("users").doc(currentId).withConverter(
      fromFirestore: UserModel.fromFirestore,
      toFirestore: (UserModel user, _) => user.toFirestore(),
    );
    final docSnap = await ref.get();
    current_user = docSnap.data()!; // Convert to UserModel object
  }

}