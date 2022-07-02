import '../model/classroom.dart';
import 'dart:async';
import '../model/responsible.dart';

class ClassroomCtrl
{
  Classroom _classroom = Classroom.empty();
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
  modifId(int value){
    _classroom.id = value;
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
  modifDescription(String value){
    _classroom.description = value;
    sink.add(_classroom);
  }
  modifIsPrivate(bool value){
    _classroom.isPrivate = value;
    sink.add(_classroom);
  }
  modifResponsible(Responsible value){
    _classroom.responsible = value;
    sink.add(_classroom);
  }

  // la methode dispose
  dispose(){
    _streamCrtl.close();
  }

}