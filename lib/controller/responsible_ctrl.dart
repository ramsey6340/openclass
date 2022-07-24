import 'dart:async';
import 'package:openclass/model/responsible.dart';

class ResponsibleCtrl
{
  Responsible _responsible = Responsible.empty();

  // stream controller pour la classe Responsible
  final _streamCtrl = StreamController<Responsible>();

  // les getters des stream controller de la classe Responsible
  Sink<Responsible> get sink => _streamCtrl.sink;
  Stream<Responsible> get stream => _streamCtrl.stream;

  // les methode de modification de la valeur
  modifResponsible(Responsible value){
    _responsible = value;
    sink.add(_responsible);
  }
  modifId(String value){
    _responsible.id = value;
    sink.add(_responsible);
  }
  modifFirstName(String value){
    _responsible.firstName = value;
    sink.add(_responsible);
  }
  modifLastName(String value){
    _responsible.lastName = value;
    sink.add(_responsible);
  }
  modifEmail(String value){
    _responsible.email = value;
    sink.add(_responsible);
  }
  modifTelNumber(String value){
    _responsible.telNumber = value;
    sink.add(_responsible);
  }
  modifImgProfile(String value){
    _responsible.imgProfile = value;
    sink.add(_responsible);
  }
  modifPassword(String value){
    _responsible.password = value;
    sink.add(_responsible);
  }
  modifDateBirth(String value){
    _responsible.dateBirth = value;
    sink.add(_responsible);
  }

  // la methode dispose
  dispose(){
    _streamCtrl.close();
  }

}