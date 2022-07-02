import 'dart:async';
import 'package:openclass/model/classroom.dart';
import 'package:openclass/model/setting_class.dart';
import 'package:openclass/model/user.dart';

class SettingClassCtrl
{
  SettingClass _settingClass = SettingClass.empty();

  // stream controller pour la classe SettingClass
  final _streamCtrl = StreamController<SettingClass>();

  // les getters des stream controller de la classe SettingClass
  Sink<SettingClass> get sink => _streamCtrl.sink;
  Stream<SettingClass> get stream => _streamCtrl.stream;

  // les methode de modification de la valeur
  modifSettingClass(SettingClass value){
    _settingClass = value;
    sink.add(_settingClass);
  }
  modifId(int value){
    _settingClass.id = value;
    sink.add(_settingClass);
  }
  modifIsNotify(bool value){
    _settingClass.isNotify = value;
    sink.add(_settingClass);
  }
  modifClassroom(Classroom value){
    _settingClass.classroom = value;
    sink.add(_settingClass);
  }
  modifUser(User value){
    _settingClass.user = value;
    sink.add(_settingClass);
  }

  // la methode dispose
  dispose(){
    _streamCtrl.close();
  }

}