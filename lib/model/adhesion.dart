import 'package:flutter/material.dart';
import 'classroom.dart';
import 'user.dart';
import 'enum_type.dart';

class Adhesion extends ChangeNotifier
{
  int _id;
  String _date;
  EnumTypeAdhesion _type;
  Classroom _classroom;
  User _user;

  Adhesion(this._id, this._date, this._type, this._classroom, this._user);

  // getters
  int get id => _id;
  String get date => _date;
  EnumTypeAdhesion get type => _type;
  Classroom get classroom => _classroom;
  User get user => _user;
  // setters
  set id(int value){
    _id = value;
    notifyListeners();
  }
  set date(String value){
    _date = value;
    notifyListeners();
  }
  set type(EnumTypeAdhesion value){
    _type = value;
    notifyListeners();
  }
  set classroom(Classroom value){
    _classroom = value;
    notifyListeners();
  }
  set user(User value){
    _user = value;
    notifyListeners();
  }
}