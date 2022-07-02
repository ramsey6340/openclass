import 'dart:async';
import 'package:openclass/model/classroom.dart';
import 'package:openclass/model/enum_type.dart';
import '../model/adhesion.dart';
import '../model/user.dart';

class AdhesionCtrl
{
  Adhesion _adhesion = Adhesion.empty();

  // stream controller pour la classe Adhesion
  final _streamCtrl = StreamController<Adhesion>();

  // les getters des stream controller de la classe Adhesion
  Sink<Adhesion> get sink => _streamCtrl.sink;
  Stream<Adhesion> get stream => _streamCtrl.stream;

  // les methode de modification de la valeur
  modifAdhesion(Adhesion value){
    _adhesion = value;
    sink.add(_adhesion);
  }
  modifId(int value){
    _adhesion.id = value;
    sink.add(_adhesion);
  }
  modifDate(String value){
    _adhesion.date = value;
    sink.add(_adhesion);
  }
  modifType(EnumTypeAdhesion value){
    _adhesion.type = value;
    sink.add(_adhesion);
  }
  modifClassroom(Classroom value){
    _adhesion.classroom = value;
    sink.add(_adhesion);
  }
  modifUser(User value){
    _adhesion.user = value;
    sink.add(_adhesion);
  }

  // la methode dispose
  dispose(){
    _streamCtrl.close();
  }

}