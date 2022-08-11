import '../model/classroom.dart';
import 'dart:async';
import '../model/responsible.dart';

class ClassroomCtrl
{
  Classroom _classroom = Classroom('','','','');
  // stream controller pour la classe Classroom
  final _streamCrtl = StreamController<Classroom>();

  // les getters des stream controller de la classe Classroom
  Sink<Classroom> get sink => _streamCrtl.sink;
  Stream<Classroom> get stream => _streamCrtl.stream;

  // les methode de modification de la valeur
  modifClassroom(Classroom value){
    _classroom = value;
    sink.add(_classroom);
  }

  modifName(String value){
    _classroom.name = value;
    sink.add(_classroom);
  }
  modifImage(String value){
    _classroom.image = value;
    sink.add(_classroom);
  }
  modifCreationdate(String value){
    _classroom.creationDate = value;
    sink.add(_classroom);
  }
  modifDescription(String? value){
    _classroom.descriptionClassroom = value;
    sink.add(_classroom);
  }
  modifIsPrivate(bool value){
    _classroom.isPrivate = value;
    sink.add(_classroom);
  }
  modifResponsible(String value){
    _classroom.responsibleId = value;
    sink.add(_classroom);
  }

  // la methode dispose
  dispose(){
    _streamCrtl.close();
  }

}