import 'dart:async';
import '../model/user.dart';

class UserCtrl
{
  User _user = User.empty();

  // stream controller pour la classe User
  final _streamCtrl = StreamController<User>();

  // les getters des stream controller de la classe User
  Sink<User> get sink => _streamCtrl.sink;
  Stream<User> get stream => _streamCtrl.stream;

  // les methode de modification de la valeur
  modifUser(User value){
    _user = value;
    sink.add(_user);
  }
  modifId(int value){
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