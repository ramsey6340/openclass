import 'package:openclass/model/category_salle.dart';
import 'package:openclass/model/classroom.dart';
import '../model/salle.dart';
import '../model/user.dart';
import 'data_classroom.dart';

// ===============================Tous les informations de la classe courente===============================


// l'id du document de l'utilisateur en cour sur Firebase
String? id_doc_firebase;

// la classe courante
Classroom data_current_classroom =   data_list_classrooms[0];

// le nombre de membre dans la classe courante
int data_current_number_of_member = 0;

// la catégorie de de salle courante
CategorySalle data_current_category = CategorySalle('','');

// la salle courante
Salle data_current_salle = Salle('','');

// la liste de catégorie de la classe courante
List<CategorySalle> data_current_list_categories_salle = [];

// la liste de tous les sallles de la classe courante
List<Salle> data_current_list_salle = [];

// l'ami courant avec qui l'utilisateur courant est entraint de discuter
UserModel data_current_friend = UserModel('');