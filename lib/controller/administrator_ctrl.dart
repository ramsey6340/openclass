import 'dart:async';

import 'package:openclass/model/administrator.dart';

import '../model/salle.dart';

class AdministratorCtrl
{
  Administrator _administrator = Administrator.empty();

  // stream controller pour la classe Administrator
  final _streamCtrl = StreamController<Administrator>();

  // les getters des stream controller de la classe Administrator
  Sink<Administrator> get sink => _streamCtrl.sink;
  Stream<Administrator> get stream => _streamCtrl.stream;

  // les methode de modification de la valeur
  modifAdministrator(Administrator value){
    _administrator = value;
    sink.add(_administrator);
  }
  modifId(int value){
    _administrator.id = value;
    sink.add(_administrator);
  }
  modifFirstName(String value){
    _administrator.firstName = value;
    sink.add(_administrator);
  }
  modifLastName(String value){
    _administrator.lastName = value;
    sink.add(_administrator);
  }
  modifEmail(String value){
    _administrator.email = value;
    sink.add(_administrator);
  }
  modifTelNumber(String value){
    _administrator.telNumber = value;
    sink.add(_administrator);
  }
  modifImgProfile(String value){
    _administrator.imgProfile = value;
    sink.add(_administrator);
  }
  modifPassword(String value){
    _administrator.password = value;
    sink.add(_administrator);
  }
  modifDateBirth(String value){
    _administrator.dateBirth = value;
    sink.add(_administrator);
  }

  // la methode dispose
  dispose(){
    _streamCtrl.close();
  }

}