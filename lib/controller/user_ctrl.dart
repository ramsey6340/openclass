import 'dart:async';
import '../model/user.dart';

class UserCtrl
{
  UserModel _user = UserModel();

  // stream controller pour la classe User
  final _streamCtrl = StreamController<UserModel>();

  // les getters des stream controller de la classe User
  Sink<UserModel> get sink => _streamCtrl.sink;
  Stream<UserModel> get stream => _streamCtrl.stream;

  // les methode de modification de la valeur
  modifUser(UserModel value){
    _user = value;
    sink.add(_user);
  }
  modifId(String value){
    _user.id = value;
    sink.add(_user);
  }
  modifFirstName(String value){
    _user.firstName = value;
    sink.add(_user);
  }
  modifLastName(String value){
    _user.lastName = value;
    sink.add(_user);
  }
  modifEmail(String value){
    _user.email = value;
    sink.add(_user);
  }
  modifTelNumber(String value){
    _user.telNumber = value;
    sink.add(_user);
  }
  modifImgProfile(String value){
    _user.imgProfile = value;
    sink.add(_user);
  }
  modifPassword(String value){
    _user.password = value;
    sink.add(_user);
  }
  modifDateBirth(String value){
    _user.dateBirth = value;
    sink.add(_user);
  }

  // la methode dispose
  dispose(){
    _streamCtrl.close();
  }

}