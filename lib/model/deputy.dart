import 'package:cloud_firestore/cloud_firestore.dart';

import 'administrator.dart';

class Deputy extends Administrator
{
  String? responsible_id;
  Deputy(
      String id,
      {
      String? first_name,
      String? last_name,
      String? email,
      String? tel_number,
      String? img_profile,
      String? password,
      String? date_birth,
      this.responsible_id}):super(id, first_name:first_name, last_name:last_name, email:email, tel_number:tel_number, img_profile:img_profile, password:password, date_birth:date_birth);

  // les getters
  String get id => super.id;
  String? get firstName => super.firstName;
  String? get lastName => super.lastName;
  String? get email => super.email;
  String? get telNumber => super.telNumber;
  String? get imgProfile => super.imgProfile;
  String? get password => super.password;
  String? get dateBirth => super.dateBirth;
  String? get responsibleId => responsible_id;

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
  set responsibleId(String? value){
    responsible_id = value;
  }

  // convertir la map en classe Classroom
  factory Deputy.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Deputy(
      data?['id'],
      first_name: data?['first_name'],
      last_name: data?['last_name'],
      email: data?['email'],
      tel_number: data?['tel_number'],
      img_profile: data?['img_profile'],
      password: data?['password'],
      date_birth: data?['date_birth'],
      responsible_id: data?['responsible_id'],
    );
  }

  // convertir la classe Classroom en map
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (firstName != null) "first_name": firstName,
      if (lastName != null) "last_name": lastName,
      if (email != null) "email": email,
      if (telNumber != null) "tel_number": telNumber,
      if (imgProfile != null) "img_profile": imgProfile,
      if (password != null) "password": password,
      if (dateBirth != null) "date_birth": dateBirth,
      if (responsibleId != null) "responsible_id": responsibleId,
    };
  }




  // les autres methodes de la super classe
  void createSalle()
  {
    super.createSalle();
  }
  void deleteSalle()
  {
    super.deleteSalle();
  }
  void createSalleCategory()
  {
    super.createSalleCategory();
  }
  void publishInfo()
  {
    super.publishInfo();
  }
  void addUser()
  {
    super.addUser();
  }
  void ejectUser()
  {
    super.ejectUser();
  }
}