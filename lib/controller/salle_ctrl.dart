import 'dart:async';
import '../model/category_salle.dart';
import '../model/salle.dart';

class SalleCtrl
{
  Salle _salle = Salle();

  // stream controller pour la classe Classroom
  final _streamCtrl = StreamController<Salle>();

  // les getters des stream controller de la classe Classroom
  Sink<Salle> get sink => _streamCtrl.sink;
  Stream<Salle> get stream => _streamCtrl.stream;

  // les methode de modification de la valeur
  modifSalle(Salle value){
    _salle = value;
    sink.add(_salle);
  }
  modifId(String? value){
    _salle.idSalle = value;
    sink.add(_salle);
  }
  modifName(String? value){
    _salle.nameSalle = value;
    sink.add(_salle);
  }
  modifCreationDate(String value){
    _salle.creationDate = value;
    sink.add(_salle);
  }
  modifIsPrivate(bool value){
    _salle.isPrivate = value;
    sink.add(_salle);
  }
  modifCategorySalle(String? value){
    _salle.categorySalleId = value;
    sink.add(_salle);
  }

  // la methode dispose
  dispose(){
    _streamCtrl.close();
  }


}