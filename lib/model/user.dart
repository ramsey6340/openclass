import 'package:flutter/material.dart';
import 'classroom.dart';
import 'discussion.dart';
import 'information.dart';
import 'document.dart';
import 'my_action.dart';

class User with ChangeNotifier
{
  int _id;
  String _first_name;
  String _last_name;
  String _email;
  String _tel_number;
  String _img_profile;
  String _password;
  String _date_birth;
  bool _is_responsable = false;
  bool _is_named = false;
  //List<Classroom> _my_classrooms;
  //List<MyAction> _my_actions;

  User(this._id,this._first_name, this._last_name, this._email, this._tel_number, this._img_profile, this._password, this._date_birth, this._is_responsable, this._is_named, /*this._my_classrooms, this._my_actions*/);

  // les accesseurs
  int get id => _id;
  String get firstName => _first_name;
  String get lastName => _last_name;
  String get email => _email;
  String get telNumber => _tel_number;
  String get imgProfile => _img_profile;
  String get password => _password;
  String get dateBirth => _date_birth;
  bool get isResponsable => _is_responsable;
  bool get isNamed => _is_named;
  //List<Classroom> get myClassrooms => _my_classrooms;
  //List<MyAction> get myActions => _my_actions;

  // les mutateurs
  set id(int value){
    _id = value;
    notifyListeners();
  }
  set firstName(String value){
    _first_name = value;
    notifyListeners();
  }
  set lastName(String value){
    _last_name = value;
    notifyListeners();
  }
  set email(String value){
    _email = value;
    notifyListeners();
  }
  set telNumber(String value){
    _tel_number = value;
    notifyListeners();
  }
  set imgProfile(String value){
    _img_profile = value;
    notifyListeners();
  }
  set password(String value){
    _password = value;
    notifyListeners();
  }
  set dateBirth(String value){
    _date_birth = value;
    notifyListeners();
  }
  set isResponsable(bool value){
    _is_responsable = value;
    notifyListeners();
  }
  set isNamed(bool value){
    _is_named = value;
    notifyListeners();
  }
  /*
  set myClassrooms(List<Classroom> value){
    _my_classrooms = value;
    notifyListeners();
  }

  set myActions(List<MyAction> value){
    _my_actions = value;
    notifyListeners();
  }
*/
}