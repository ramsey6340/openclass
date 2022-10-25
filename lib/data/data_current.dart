import 'package:firebase_auth/firebase_auth.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/model/classroom.dart';
import 'package:openclass/model/salle.dart';
import 'package:openclass/model/user.dart';

// l'utilisateur courent
UserModel current_user = UserModel('','');
// l'id de l'utilisateur courent
String? current_user_id;
// l'id de la classe courent
String current_classroom_id = '';
// les id des trois categories de base
List<String> current_categories_salle_id = [];
// la classe courent avec un id vide
Classroom current_classroom = Classroom('',false,'','','');
// la categorie courent avec un id vide
CategorySalle current_category = CategorySalle('','');
// l'ami avec la laquelle l'utilisateur est entrain de discuter
UserModel current_friend = UserModel('','');
// concatenation de l'id de l'utilisateur courent et de l'ami ou la salle avec lequel il discute actuellement
String current_group_id = '';
// l'id de l'ami ou la salle avec lequel l'utilisateur discute actuellement
String current_peer_id = '';
// le nombre total de membre dans la classe courente
int current_number_of_member = 0;
// la salle courent
Salle current_salle = Salle('','');
// l'index courent pour la bar de menu en bas
int current_menu_index = 0;

// liste des id des classes de l'utilisateur
List<String> current_list_id_classroom = [''];

// list des nom des membres de la classe courente
List<String> current_list_name_members = [];
// list des utilisateur de la base de données
List<String> users_list_of_data_base = [];
