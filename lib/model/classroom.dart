import 'package:flutter/material.dart';
import 'category_salle.dart';
import 'user.dart';

class Classroom with ChangeNotifier
{
  int _id;
  String _name;
  String _image;
  String _create_date;
  String _description;
  //List<CategorySalle> _categories;
  User _user;

  Classroom(this._id, this._name, this._image, this._create_date, this._description, /*this._categories,*/ this._user);

  //les accesseurs
  int get id => _id;
  String get name => _name;
  String get image => _image;
  String get dateCreate => _create_date;
  String get description => _description;
  //List<CategorySalle> get categories => _categories;
  User get user => _user;

  // les mutateurs
  set id(int value){
    _id = value;
    notifyListeners();
  }
  set name(String value){
    _name = value;
    notifyListeners();
  }
  set image(String value){
    _image = value;
    notifyListeners();
  }
  set description(String value){
    _description = value;
    notifyListeners();
  }
  /*
  set categories(List<CategorySalle> value){
    _categories = value;
    notifyListeners();
  }*/
  set user(User value){
    _user = value;
    notifyListeners();
  }
}