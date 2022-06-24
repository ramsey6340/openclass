import 'package:flutter/material.dart';
import 'salle.dart';
import 'user.dart';

class MyAction with ChangeNotifier
{
  int _id;
  String _content;
  String _publication_date;
  //Salle _salle;
  User _user;

  MyAction(this._id, this._content, this._publication_date,this._user);

  // getters
  int get id => _id;
  String get content => _content;
  String get publicationDate => _publication_date;
  User get user => _user;

  // setters
  set id(int value){
    _id = value;
    notifyListeners();
  }
  set content(String value){
    _content = value;
    notifyListeners();
  }
  set publicationDate(String value){
    _publication_date = value;
    notifyListeners();
  }
  set user(User value){
    _user = value;
    notifyListeners();
  }
}