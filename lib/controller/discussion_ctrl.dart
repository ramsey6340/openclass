import 'dart:async';
import 'package:openclass/model/discussion.dart';
import 'package:openclass/model/salle.dart';
import 'package:openclass/model/user.dart';

class DiscussionCtrl
{
  Discussion _discussion = Discussion.empty();

  // stream controller pour la classe Discussion
  final _streamCtrl = StreamController<Discussion>();

  // les getters des stream controller de la classe Discussion
  Sink<Discussion> get sink => _streamCtrl.sink;
  Stream<Discussion> get stream => _streamCtrl.stream;

  // les methode de modification de la valeur
  modifDiscussion( value){
    _discussion = value;
    sink.add(_discussion);
  }
  modifId(int value){
    _discussion.id = value;
    sink.add(_discussion);
  }
  modifContent(String value){
    _discussion.content = value;
    sink.add(_discussion);
  }
  modifPublicationDate(String value){
    _discussion.publicationDate = value;
    sink.add(_discussion);
  }
  modifSalle(Salle value){
    _discussion.salle = value;
    sink.add(_discussion);
  }
  modifUser(UserModel value){
    _discussion.user = value;
    sink.add(_discussion);
  }

  // la methode dispose
  dispose(){
    _streamCtrl.close();
  }

}