import 'salle.dart';
import 'user.dart';

abstract class MyAction
{
  late int _id;
  late String _content;
  late String _publication_date;
  late Salle _salle;
  late UserModel _user;

  MyAction(this._id, this._content, this._publication_date, this._salle, this._user);
  MyAction.empty()
  {
    this._id = 0;
    this._content = "";
    this._publication_date = "";
    this._user = UserModel();
  }
  // getters
  int get id => _id;
  String get content => _content;
  String get publicationDate => _publication_date;
  Salle get salle => _salle;
  UserModel get user => _user;

  // setters
  set id(int value){
    _id = value;
  }
  set content(String value){
    _content = value;
  }
  set publicationDate(String value){
    _publication_date = value;
  }
  set salle(Salle value){
    _salle = value;
  }
  set user(UserModel value){
    _user = value;
  }

}