class User
{
  // les attribues
  late int _id;
  late String _first_name;
  late String _last_name;
  late String _email;
  late String _tel_number;
  late String _img_profile;
  late String _password;
  late String _date_birth;

  // les constructeurs
  User(this._id,this._first_name, this._last_name, this._email, this._tel_number, this._img_profile, this._password, this._date_birth);
  User.empty()
  {
    this._id = 1;
    this._first_name = "";
    this._last_name = "";
    this._email = "";
    this._tel_number = "";
    this._img_profile = "";
    this._password = "";
    this._date_birth = "";
  }
  // les accesseurs
  int get id => _id;
  String get firstName => _first_name;
  String get lastName => _last_name;
  String get email => _email;
  String get telNumber => _tel_number;
  String get imgProfile => _img_profile;
  String get password => _password;
  String get dateBirth => _date_birth;

  // les mutateurs
  set id(int value){
    _id = value;
  }
  set firstName(String value){
    _first_name = value;
  }
  set lastName(String value){
    _last_name = value;
  }
  set email(String value){
    _email = value;
  }
  set telNumber(String value){
    _tel_number = value;
  }
  set imgProfile(String value){
    _img_profile = value;
  }
  set password(String value){
    _password = value;
  }
  set dateBirth(String value){
    _date_birth = value;
  }

}