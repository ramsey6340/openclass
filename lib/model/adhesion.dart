import 'classroom.dart';
import 'user.dart';
import 'enum_type.dart';

class Adhesion
{
  // les attribues
  String? id_adhesion;
  String? adhesion_date;
  EnumTypeAdhesion? adhesion_type;
  bool? receive_notification;
  String? classroom_id;
  String? user_id;

  //les contructeurs
  Adhesion(
      {this.id_adhesion,
      this.adhesion_date,
      this.adhesion_type,
      this.receive_notification,
      this.classroom_id,
      this.user_id});

  // getters
  String? get id => id_adhesion;
  String? get date => adhesion_date;
  EnumTypeAdhesion? get type => adhesion_type;
  bool? get receiveNotification => receive_notification;
  String? get classroomId => classroom_id;
  String? get userId => user_id;

  // setters
  set idAdhesion(String? value){
    id_adhesion = value;
  }
  set adhesionDate(String? value){
    adhesion_date = value;
  }
  set adhesionType(EnumTypeAdhesion? value){
    adhesion_type = value;
  }
  set receiveNotification(bool? value){
    receive_notification = value;
  }
  set classroomId(String? value){
    classroom_id = value;
  }
  set userId(String? value){
    user_id = value;
  }

}