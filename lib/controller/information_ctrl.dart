import 'dart:async';
import 'package:openclass/model/information.dart';

import '../model/salle.dart';
import '../model/user.dart';

class InformationCtrl
{
  Information _information = Information('','','','');

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
  modifId(String value){
    _information.id_action = value;
    sink.add(_information);
  }
  modifContent(String value){
    _information.content_action = value;
    sink.add(_information);
  }
  modifPublicationDate(String value){
    _information.publicationDate = value;
    sink.add(_information);
  }
  modifSalle(String value){
    _information.salle_action_id = value;
    sink.add(_information);
  }
  modifUser(String value){
    _information.user_action_name = value;
    sink.add(_information);
  }

  // la methode dispose
  dispose(){
    _streamCtrl.close();
  }

}