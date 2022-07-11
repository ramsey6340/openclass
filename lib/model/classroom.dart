import 'responsible.dart';

class Classroom
{
  late int _id;
  late String _name;
  late String _image;
  late String _creation_date;
  late String _description;
  late bool _is_private;
  late Responsible _responsible;

  Classroom(this._id, this._name, this._image, this._creation_date, this._description, this._is_private, this._responsible);
  Classroom.empty()
  {
    this._id = 0;
    this._name = "";
    this._image = "";
    this._creation_date = "";
    this._description = "";
    this._is_private = false;
    this._responsible = Responsible.empty();
  }

  //les accesseurs
  int get id => _id;
  String get name => _name;
  String get image => _image;
  String get creationDate => _creation_date;
  String get description => _description;
  bool get isPrivate => _is_private;
  Responsible get responsible => _responsible;

  // les mutateurs
  set id(int value){
    _id = value;
  }
  set name(String value){
    _name = value;
  }
  set image(String value){
    _image = value;
  }
  set creationDate(String value){
    _creation_date = value;
  }
  set description(String value){
    _description = value;
  }
  set isPrivate(bool value){
    _is_private = value;
  }
  set responsible(Responsible value){
    _responsible = value;
  }

}