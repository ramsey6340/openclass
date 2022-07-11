// Tous les informations de la classe courente

import 'package:openclass/model/category_salle.dart';
import 'package:openclass/model/classroom.dart';
import '../model/salle.dart';
import 'data_classroom.dart';

Classroom data_current_classroom =   data_list_classrooms[0];

int data_current_number_of_member = 0;

CategorySalle data_current_category = CategorySalle.empty();

Salle data_current_salle = Salle.empty();

List<CategorySalle> data_current_list_categories_salle = [];

List<Salle> data_current_list_salle = [];