import 'my_action.dart';
import 'salle.dart';
import 'user.dart';

class Document extends MyAction
{
  Document(int id, String content, String publication_date, User user):super(id, content, publication_date, user);

  int get id => super.id;
  String get content => super.content;
  String get publicationDate => super.publicationDate;
  User get user => super.user;

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
  set user(User value){
    super.user = value;
  }
}