class Increment
{
  static int id_category = 4;
  static int id_classroom = 1;
  static int id_salle = 3;
  static int id_current_classroom = 1;
  static int id_current_category = 0;

  static int get idCategory => ++id_category;
  static int get idClassroom => ++id_classroom;
  static int get idSalle => ++id_salle;

  static set idCurrentClassroom(int value) => id_current_classroom = value;
  static set idCurrentCategory(int value) => id_current_category = value;


}