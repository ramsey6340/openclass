import 'classroom.dart';
import 'user.dart';

class SettingClass
{
  // les attribues
  late int _id;
  late bool _is_notify;
  late Classroom _classroom;
  late UserModel _user;

  // les constructeurs
  SettingClass(this._id, this._is_notify, this._classroom, this._user);
  SettingClass.empty()
  {
    this._id = 0;
    this._is_notify = false;
    this._classroom = Classroom('');
    this._user = UserModel('');
  }

  // getters
  int get id => _id;
  Classroom get classroom => _classroom;
  UserModel get user => _user;
  bool get isNotify => _is_notify;

  // setters
  set id(int value){
    _id = value;
  }
  set classroom(Classroom value){
    _classroom = value;
  }
  set user(UserModel value){
    _user = value;
  }
  set isNotify(bool value){
    _is_notify = value;
  }

}