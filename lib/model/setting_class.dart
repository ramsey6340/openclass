import 'classroom.dart';
import 'user.dart';

class SettingClass
{
  // les attribues
  late int _id;
  late bool _is_notify;
  late Classroom _classroom;
  late User _user;

  // les constructeurs
  SettingClass(this._id, this._is_notify, this._classroom, this._user);
  SettingClass.empty()
  {
    this._id = 0;
    this._is_notify = false;
    this._classroom = Classroom.empty();
    this._user = User.empty();
  }

  // getters
  int get id => _id;
  Classroom get classroom => _classroom;
  User get user => _user;
  bool get isNotify => _is_notify;

  // setters
  set id(int value){
    _id = value;
  }
  set classroom(Classroom value){
    _classroom = value;
  }
  set user(User value){
    _user = value;
  }
  set isNotify(bool value){
    _is_notify = value;
  }

}