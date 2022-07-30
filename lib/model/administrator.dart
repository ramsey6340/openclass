import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';

class Administrator extends UserModel
{
  Administrator(
      String id,
      {
      String? first_name,
      String? last_name,
      String? email,
      String? tel_number,
      String? img_profile,
      String? password,
      String? date_birth}):super(id, first_name:first_name, last_name:last_name, email:email, tel_number:tel_number, img_profile:img_profile, password:password, date_birth:date_birth);

  // les getters
  String get id => super.id;
  String? get firstName => super.firstName;
  String? get lastName => super.lastName;
  String? get email => super.email;
  String? get telNumber => super.telNumber;
  String? get imgProfile => super.imgProfile;
  String? get password => super.password;
  String? get dateBirth => super.dateBirth;

  // les setters
  set firstName(String? value){
    firstName = value;
  }
  set lastName(String? value){
    lastName = value;
  }
  set email(String? value){
    email = value;
  }
  set telNumber(String? value){
    telNumber = value;
  }
  set imgProfile(String? value){
    imgProfile = value;
  }
  set password(String? value){
    password = value;
  }
  set dateBirth(String? value){
    dateBirth = value;
  }

  // convertir la map en classe Administrator
  factory Administrator.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Administrator(
      data?['id'],
      first_name: data?['first_name'],
      last_name: data?['last_name'],
      email: data?['email'],
      tel_number: data?['tel_number'],
      img_profile: data?['img_profile'],
      password: data?['password'],
      date_birth: data?['date_birth'],
    );
  }

  // convertir la classe Administrator en map
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
    };
  }



  // les autres methode
  void createSalle()
  {
    // code ...
  }
  void deleteSalle()
  {
    // code ...
  }
  void createSalleCategory()
  {
    // code ...
  }
  void publishInfo()
  {
    // code ...
  }
  void addUser()
  {
    // code ...
  }
  void ejectUser()
  {
    // code ...
  }

}