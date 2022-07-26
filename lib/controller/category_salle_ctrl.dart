import 'dart:async';
import 'package:openclass/model/classroom.dart';
import 'package:openclass/model/enum_type.dart';
import 'classroom_ctrl.dart';
import '../model/category_salle.dart';

class CategorySalleCtrl
{
  CategorySalle _categorySalle = CategorySalle();
  // stream controller pour la classe CategorySalle
  final _streamCtrl = StreamController<CategorySalle>();

  // les getters des stream controller de la classe CategorySalle
  Sink<CategorySalle> get sink => _streamCtrl.sink;
  Stream<CategorySalle> get stream => _streamCtrl.stream;

  // les methode de modification de la valeur
  modifCategorySalle(CategorySalle value){
    _categorySalle = value;
    sink.add(_categorySalle);
  }
  modifId(String? value){
    _categorySalle.idCategory = value;
    sink.add(_categorySalle);
  }
  modifName(String? value){
    _categorySalle.nameCategory = value;
    sink.add(_categorySalle);
  }
  modifCreationDate(String? value){
    _categorySalle.creationDate = value;
    sink.add(_categorySalle);
  }
  modifDescription(String? value){
    _categorySalle.descriptionCategory = value;
    sink.add(_categorySalle);
  }
  modifType(String? value){
    _categorySalle.typeCategory = value;
    sink.add(_categorySalle);
  }
  modifClassroom(String? value){
    _categorySalle.classroomId = value;
    sink.add(_categorySalle);
  }
  // la methode dispose
  dispose(){
    _streamCtrl.close();
  }

}