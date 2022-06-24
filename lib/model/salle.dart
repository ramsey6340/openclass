import 'package:flutter/material.dart';
import 'category_salle.dart';
import 'my_action.dart';

class Salle with ChangeNotifier
{
  int _id;
  String _name;
  String _creation_date;
  CategorySalle _category_salle;
  MyAction _my_action;

  Salle(this._id, this._name, this._creation_date, this._category_salle, this._my_action);

  // Les accesseurs
  int get id => _id;
  String get name => _name;
  String get creationDate => _creation_date;
  CategorySalle get categorySalle => _category_salle;
  MyAction get myAction => _my_action;
  // Les mutateurs
  set id(int value){
    _id = value;
    notifyListeners();
  }
  set name(String value){
    _name = value;
    notifyListeners();
  }
  set creationDate(String value){
    _creation_date = value;
    notifyListeners();
  }
  set myAction(MyAction value){
    _my_action = value;
    notifyListeners();
  }
}