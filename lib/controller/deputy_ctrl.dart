import 'dart:async';
import 'package:openclass/model/deputy.dart';

class DeputyCtrl
{
  Deputy _deputy = Deputy('','');

  // stream controller pour la classe Deputy
  final _streamCtrl = StreamController<Deputy>();

  // les getters des stream controller de la classe Deputy
  Sink<Deputy> get sink => _streamCtrl.sink;
  Stream<Deputy> get stream => _streamCtrl.stream;

  // les methode de modification de la valeur
  modifDeputy(Deputy value){
    _deputy = value;
    sink.add(_deputy);
  }
  modifFirstName(String value){
    _deputy.firstName = value;
    sink.add(_deputy);
  }
  modifLastName(String value){
    _deputy.lastName = value;
    sink.add(_deputy);
  }
  modifEmail(String value){
    _deputy.email = value;
    sink.add(_deputy);
  }
  modifTelNumber(String value){
    _deputy.telNumber = value;
    sink.add(_deputy);
  }
  modifImgProfile(String value){
    _deputy.imgProfile = value;
    sink.add(_deputy);
  }
  modifPassword(String value){
    _deputy.password = value;
    sink.add(_deputy);
  }
  modifDateBirth(String value){
    _deputy.dateBirth = value;
    sink.add(_deputy);
  }
  modifResponsible(String? value){
    _deputy.responsibleId = value;
    sink.add(_deputy);
  }

  // la methode dispose
  dispose(){
    _streamCtrl.close();
  }

}