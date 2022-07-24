import 'classroom.dart';
import 'user.dart';
import 'enum_type.dart';

class Adhesion
{
  // les attribues
  late int _id;
  late String _date;
  late EnumTypeAdhesion _type;
  late bool _receive_notification;
  late Classroom _classroom;
  late UserModel _user;

  //les contructeurs
  Adhesion(this._id, this._date, this._type, this._receive_notification, this._classroom, this._user);
  Adhesion.empty()
  {
    this._id = 0;
    this._date = "";
    this._type = EnumTypeAdhesion.par_invitation;
    this._receive_notification = true;
    this._classroom = Classroom.empty();
    this._user = UserModel();
  }

  // getters
  int get id => _id;
  String get date => _date;
  EnumTypeAdhesion get type => _type;
  bool get receiveNotification => _receive_notification;
  Classroom get classroom => _classroom;
  UserModel get user => _user;

  // setters
  set id(int value){
    _id = value;
  }
  set date(String value){
    _date = value;
  }
  set type(EnumTypeAdhesion value){
    _type = value;
  }
  set receiveNotification(bool value){
    _receive_notification = value;
  }
  set classroom(Classroom value){
    _classroom = value;
  }
  set user(UserModel value){
    _user = value;
  }

}