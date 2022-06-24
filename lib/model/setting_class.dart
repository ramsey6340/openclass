import 'package:flutter/material.dart';
import 'classroom.dart';
import 'user.dart';

class SettingClass with ChangeNotifier
{
  int _id;
  Classroom _classroom;
  User _user;
  bool _is_notify;

  SettingClass(this._id, this._classroom, this._user, this._is_notify);

  // getters
  int get id => _id;
  Classroom get classroom => _classroom;
  User get user => _user;
  bool get isNotify => _is_notify;
  // setters
  set id(int value){
    _id = value;
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
  set isNotify(bool value){
    _is_notify = value;
    notifyListeners();
  }
}