import 'dart:async';
import 'package:openclass/model/salle.dart';
import 'package:openclass/model/user.dart';
import '../model/document.dart';

class DocumentCtrl
{
  Document _document = Document.empty();

  // stream controller pour la classe Document
  final _streamCtrl = StreamController<Document>();

  // les getters des stream controller de la classe Document
  Sink<Document> get sink => _streamCtrl.sink;
  Stream<Document> get stream => _streamCtrl.stream;

  // les methode de modification de la valeur
  modif( value){
    _document = value;
    sink.add(_document);
  }
  modifId(int value){
    _document.id = value;
    sink.add(_document);
  }
  modifContent(String value){
    _document.content = value;
    sink.add(_document);
  }
  modifPublicationDate(String value){
    _document.publicationDate = value;
    sink.add(_document);
  }
  modifSalle(Salle value){
    _document.salle = value;
    sink.add(_document);
  }
  modifUser(UserModel value){
    _document.user = value;
    sink.add(_document);
  }

  // la methode dispose
  dispose(){
    _streamCtrl.close();
  }

}