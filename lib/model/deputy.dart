import 'administrator.dart';
import 'responsible.dart';

class Deputy extends Administrator
{
  late Responsible _responsible;
  Deputy(String id, String first_name, String last_name, String email, String tel_number, String img_profile, String password, String date_birth, this._responsible):super(id, first_name, last_name, email, tel_number, img_profile, password, date_birth);
  Deputy.empty():super.empty(){
    _responsible = Responsible.empty();
  }

  // les getters
  String? get id => super.id;
  String? get firstName => super.firstName;
  String? get lastName => super.lastName;
  String? get email => super.email;
  String? get telNumber => super.telNumber;
  String? get imgProfile => super.imgProfile;
  String? get password => super.password;
  String? get dateBirth => super.dateBirth;
  Responsible get responsible => _responsible;

  // les setters
  set id(String? value){
    id = value;
  }
  set firstName(String? value){
    firstName = value;
  }
  set lastName(String? value){
    lastName = value;
  }
  set email(String? value){
    email = value;
  }
  set telNumber(String? value){
    telNumber = value;
  }
  set imgProfile(String? value){
    imgProfile = value;
  }
  set password(String? value){
    password = value;
  }
  set dateBirth(String? value){
    dateBirth = value;
  }
  set responsible(Responsible value){
    _responsible = value;
  }

  // les autres methodes de la super classe
  void createSalle()
  {
    super.createSalle();
  }
  void deleteSalle()
  {
    super.deleteSalle();
  }
  void createSalleCategory()
  {
    super.createSalleCategory();
  }
  void publishInfo()
  {
    super.publishInfo();
  }
  void addUser()
  {
    super.addUser();
  }
  void ejectUser()
  {
    super.ejectUser();
  }
}