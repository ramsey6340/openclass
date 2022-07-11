import 'classroom.dart';
import 'user.dart';
import 'enum_type.dart';

class Adhesion
{
  // les attribues
  late int _id;
  late String _date;
  late EnumTypeAdhesion _type;
  late bool _receive_notificatio;
  late Classroom _classroom;
  late User _user;

  //les contructeurs
  Adhesion(this._id, this._date, this._type, this._receive_notificatio, this._classroom, this._user);
  Adhesion.empty()
  {
    this._id = 0;
    this._date = "";
    this._type = EnumTypeAdhesion.par_invitation;
    this._receive_notificatio = true;
    this._classroom = Classroom.empty();
    this._user = User.empty();
  }

  // getters
  int get id => _id;
  String get date => _date;
  EnumTypeAdhesion get type => _type;
  bool get receiveNotification => _receive_notificatio;
  Classroom get classroom => _classroom;
  User get user => _user;

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
    _receive_notificatio = value;
  }
  set classroom(Classroom value){
    _classroom = value;
  }
  set user(User value){
    _user = value;
  }

}