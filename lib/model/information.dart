import 'my_action.dart';
import 'salle.dart';
import 'user.dart';

class Information extends MyAction
{
  // les constructeurs
  Information(int id, String content, String publication_date, Salle salle, UserModel user):super(id, content, publication_date, salle, user);
  Information.empty():super.empty();

  // les getters
  int get id => super.id;
  String get content => super.content;
  String get publicationDate => super.publicationDate;
  Salle get salle => super.salle;
  UserModel get user => super.user;

  // les setters
  @override
  set id(int value){
    super.id = value;
  }
  @override
  set content(String value){
    super.content = value;
  }
  @override
  set publicationDate(String value){
    super.publicationDate = value;
  }
  @override
  set salle(Salle value){
  super.salle;
  }
  @override
  set user(UserModel value){
    super.user = value;
  }

}