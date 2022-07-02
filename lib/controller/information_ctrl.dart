import 'dart:async';
import 'package:openclass/model/information.dart';

import '../model/salle.dart';
import '../model/user.dart';

class InformationCtrl
{
  Information _information = Information.empty();

  // stream controller pour la classe Information
  final _streamCtrl = StreamController<Information>();

  // les getters des stream controller de la classe Information
  Sink<Information> get sink => _streamCtrl.sink;
  Stream<Information> get stream => _streamCtrl.stream;

  // les methode de modification de la valeur
  modifInformation(Information value){
    _information = value;
    sink.add(_information);
  }
  modifId(int value){
    _information.id = value;
    sink.add(_information);
  }
  modifContent(String value){
    _information.content = value;
    sink.add(_information);
  }
  modifPublicationDate(String value){
    _information.publicationDate = value;
    sink.add(_information);
  }
  modifSalle(Salle value){
    _information.salle = value;
    sink.add(_information);
  }
  modifUser(User value){
    _information.user = value;
    sink.add(_information);
  }

  // la methode dispose
  dispose(){
    _streamCtrl.close();
  }

}