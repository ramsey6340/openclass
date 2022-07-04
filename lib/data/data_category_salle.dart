import '../model/category_salle.dart';
import '../model/enum_type.dart';
import 'data_classroom.dart';

/* ========================== Instances de la classe  CategorySalle ========================== */
List<CategorySalle> data_List_categories_salle =
[
  CategorySalle(1, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[0]),
  CategorySalle(2, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[0]),
  CategorySalle(3, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[0]),
  CategorySalle(4, 'SALLES CORANIQUE', '12/02/2022','Salle de catégorie lecture de coran', EnumCategorySalle.discussion, data_list_classrooms[0]),
/*
  CategorySalle(5, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[1]),
  CategorySalle(6, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[1]),
  CategorySalle(7, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[1]),

  CategorySalle(8, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[2]),
  CategorySalle(9, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[2]),
  CategorySalle(10, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[2]),

  CategorySalle(11, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[3]),
  CategorySalle(12, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[3]),
  CategorySalle(13, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[3]),

  CategorySalle(14, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[4]),
  CategorySalle(15, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[4]),
  CategorySalle(16, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[4]),

  CategorySalle(17, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[5]),
  CategorySalle(18, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[5]),
  CategorySalle(19, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[5]),

  CategorySalle(19, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[6]),
  CategorySalle(20, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[6]),
  CategorySalle(21, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[6]),

  CategorySalle(22, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[7]),
  CategorySalle(23, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[7]),
  CategorySalle(24, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[7]),

  CategorySalle(25, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[8]),
  CategorySalle(26, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[8]),
  CategorySalle(27, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[8]),

  CategorySalle(28, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[9]),
  CategorySalle(29, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[9]),
  CategorySalle(30, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[9]),

  CategorySalle(31, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[10]),
  CategorySalle(32, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[10]),
  CategorySalle(33, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[10]),

  CategorySalle(34, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[11]),
  CategorySalle(35, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[11]),
  CategorySalle(36, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[11]),

  CategorySalle(37, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information, data_list_classrooms[12]),
  CategorySalle(38, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque, data_list_classrooms[12]),
  CategorySalle(39, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion, data_list_classrooms[12]),

 */
];
/* ========================== FIN ========================== */
