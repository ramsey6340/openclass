import 'enum_type.dart';
import 'classroom.dart';

class CategorySalle
{
  late int _id;
  late String _name;
  late String _creation_date;
  late String _description;
  late bool _is_private;
  late EnumCategorySalle _type;
  late Classroom _classroom;

  CategorySalle(this._id, this._name, this._creation_date, this._description, this._is_private, this._type,this._classroom);
  CategorySalle.empty()
  {
    this._id = 0;
    this._name = "";
    this._creation_date = "";
    this._description = "";
    this._is_private = false;
    this._type = EnumCategorySalle.discussion;
    this._classroom = Classroom.empty();
  }

  // les getters
  int get id => _id;
  String get name => _name;
  String get creationDate => _creation_date;
  String get description => _description;
  bool get isPrivate => _is_private;
  EnumCategorySalle get type => _type;
  Classroom get classroom => _classroom;
  //les setters
  set id(int value){
    _id = value;
  }
  set name(String value){
    _name = value;
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
  set type(EnumCategorySalle value){
    _type = value;
  }
  set classroom(Classroom value){
    _classroom = value;
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