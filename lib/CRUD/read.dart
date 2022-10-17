import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:openclass/controller/user_ctrl.dart';
import 'package:openclass/model/user.dart';
import '../data/data_current.dart';
import '../model/classroom.dart';

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

  // List des utilisateurs de OpenClass
  Future<void> getUsersList() async{
    FirebaseFirestore db = FirebaseFirestore.instance;
    final refUsersList = db.collection("users").get().then(
      (value) {
        int length = value.docs.length;

        for(int i=0; i<length; i++){
          final data = value.docs[i].data();
          users_list_of_data_base.add(data['id']);
        }
        print(users_list_of_data_base);
      }
    );
  }

  Future<String> getText(String string) async{
    return  Future.value(string);
  }

}