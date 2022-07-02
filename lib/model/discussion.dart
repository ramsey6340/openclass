import 'my_action.dart';
import 'salle.dart';
import 'user.dart';

class Discussion extends MyAction
{
  // les constructeurs
  Discussion(int id, String content, String publication_date, Salle salle, User user):super(id, content, publication_date, salle, user);
  Discussion.empty():super.empty();

  // les getters
  int get id => super.id;
  String get content => super.content;
  String get publicationDate => super.publicationDate;
  Salle get salle => super.salle;
  User get user => super.user;

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
    super.salle = value;
  }
  @override
  set user(User value){
    super.user = value;
  }

}