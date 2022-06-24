import 'package:flutter/material.dart';
import 'enum_type.dart';
import 'salle.dart';
import 'classroom.dart';

class CategorySalle with ChangeNotifier
{
  int _id;
  String _name;
  String _creation_date;
  String _description;
  EnumCategorySalle _type;
  //List<Salle> _salles;
  Classroom _classroom;

  CategorySalle(this._id, this._name, this._creation_date, this._description, this._type, /*this._salles*/ this._classroom);

  // les getters
  int get id => _id;
  String get name => _name;
  String get creationDate => _creation_date;
  String get description => _description;
  EnumCategorySalle get type => _type;
  //List<Salle> get salles => _salles;
  Classroom get classroom => _classroom;
  //les setters
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
  set description(String value){
    _description = value;
    notifyListeners();
  }
  set type(EnumCategorySalle value){
    _type = value;
    notifyListeners();
  }
/*set salles(List<Salle> value){
    _salles = value;
    notifyListeners();
  }

 */
  set classroom(Classroom value){
    _classroom = value;
    notifyListeners();
  }

  //les methodes
  /*

   void add(MyModel model) {
    modelsList.add(model);
    notifyListeners();
  }

  void removeAt(int index) {
    modelsList.removeAt(index);
    notifyListeners();
  }

  void editModelNumber(int index,int newModelNumber){
    modelsList[index].edit(newModelNumber);
    notifyListeners();
  }

   */
}