import 'category_salle.dart';

class Salle
{
  late int _id;
  late String _name;
  late String _creation_date;
  late bool _is_private;
  late CategorySalle _category_salle;

  Salle(this._id, this._name, this._creation_date, this._is_private, this._category_salle);
  Salle.empty()
  {
    _id = 0;
    _name = "";
    _creation_date = "";
    _is_private = false;
    _category_salle = CategorySalle.empty();
  }

  // Les accesseurs
  int get id => _id;
  String get name => _name;
  String get creationDate => _creation_date;
  bool get isPrivate => _is_private;
  CategorySalle get categorySalle => _category_salle;
  // Les mutateurs
  set id(int value){
    _id = value;
  }
  set name(String value){
    _name = value;
  }
  set creationDate(String value){
    _creation_date = value;
  }
  set isPrivate(bool value){
    _is_private = value;
  }
  set categorySalle(CategorySalle value){
    _category_salle = value;
  }

}