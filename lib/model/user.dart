import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel
{
  // les attribues
  String id;
  String? first_name;
  String? last_name;
  String email;
  String? tel_number;
  String? img_profile;
  String? password;
  String? date_birth;
  String? date_creation;

  // les constructeurs
  UserModel(
      this.id,
      this.email,
      {
      this.first_name,
      this.last_name,
      this.tel_number,
      this.img_profile,
      this.password,
      this.date_birth,
      this.date_creation});
  // les accesseurs
  String get idU => id;
  String? get firstName => first_name;
  String? get lastName => last_name;
  String get emailU => email;
  String? get telNumber => tel_number;
  String? get imgProfile => img_profile;
  String? get passwordU => password;
  String? get dateBirth => date_birth;
  String? get dateCreation => date_creation;

  // les mutateurs
  set idU(String value){
    id = value;
  }
  // les mutateurs
  set firstName(String? value){
    first_name = value;
  }
  set lastName(String? value){
    last_name = value;
  }
  set emailU(String value){
    email = value;
  }
  set telNumber(String? value){
    tel_number = value;
  }
  set imgProfile(String? value){
    img_profile = value;
  }
  set passwordU(String? value){
    password = value;
  }
  set dateBirth(String? value){
    date_birth = value;
  }
  set dateCreation(String? value){
    date_creation = value;
  }

  // les autres methodes

  // convertir la map en classe UserModel
  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return UserModel(
      data?['id'],
      data?['email'],
      first_name: data?['first_name'],
      last_name: data?['last_name'],
      tel_number: data?['tel_number'],
      img_profile: data?['img_profile'],
      password: data?['password'],
      date_birth: data?['date_birth'],
      date_creation: data?['date_creation'],
    );
  }

  // convertir un DocumentSnapshot en classe UserModel
  factory UserModel.fromSnapshot(DocumentSnapshot? snapshot) {
    final data = snapshot?.data() as Map<String, dynamic>;
    return UserModel(
      data['id'],
      data['email'],
      first_name: data['first_name'],
      last_name: data['last_name'],
      tel_number: data['tel_number'],
      img_profile: data['img_profile'],
      password: data['password'],
      date_birth: data['date_birth'],
      date_creation: data['date_creation'],
    );
  }

  // convertir la classe UserModel en map
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (first_name != null) "first_name": first_name,
      if (last_name != null) "last_name": last_name,
      if (email != null) "email": email,
      if (tel_number != null) "tel_number": tel_number,
      if (img_profile != null) "img_profile": img_profile,
      if (password != null) "password": password,
      if (date_birth != null) "date_birth": date_birth,
      if (date_creation != null) "date_creation": date_creation,
    };
  }

}