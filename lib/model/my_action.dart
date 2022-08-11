import 'salle.dart';
import 'user.dart';

abstract class MyAction
{
  String id_action;
  String salle_action_id;
  String user_action_name;
  String? content_action;
  String? publication_date;
  String? name_classroom;
  String id_classroom;

  MyAction(this.id_action, this.salle_action_id, this.user_action_name,this.id_classroom,
      {this.content_action, this.publication_date, this.name_classroom});
  // getters
  String get idAction => id_action;
  String? get contentAction => content_action;
  String? get publicationDate => publication_date;
  String? get nameClassroom => name_classroom;
  String get salleActionId => salle_action_id;
  String get userActionName => user_action_name;
  String get idClassroom => id_classroom;

  // setters
  set idAction(String value){
    id_action = value;
  }
  set contentAction(String? value){
    content_action = value;
  }
  set publicationDate(String? value){
    publication_date = value;
  }
  set nameClassroom(String? value){
    name_classroom = value;
  }
  set salleAction(String value){
    salle_action_id = value;
  }
  set userActionName(String value){
    user_action_name = value;
  }
  set idClassroom(String value){
    id_classroom = value;
  }

}