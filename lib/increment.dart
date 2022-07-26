class Increment
{
  static String? id_category = '4';
  static String? id_classroom = '1';
  static String? id_salle = '3';
  static String? id_current_classroom = '1';
  static String? id_current_category = '0';

  //static int get idCategory => ++id_category;
  //static int get idClassroom => ++id_classroom;
  //static int get idSalle => ++id_salle;

  static set idCurrentClassroom(String? value) => id_current_classroom = value;
  static set idCurrentCategory(String? value) => id_current_category = value;


}