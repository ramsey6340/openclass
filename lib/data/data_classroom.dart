import '../model/classroom.dart';
import 'data_responsible.dart';

/* ========================== List des classes ========================== */
List<Classroom> data_list_classrooms =
[
  Classroom(1, 'OpenClass', 'assets/images/openclass_profile.png','10/07/2022', 'Une classe de base pour tous les utilisateurs de l\'app', false, data_list_responsible[0]),
  /*
  Classroom(2, 'Hyper', 'assets/images/img_default_class.png','03/11/2022', 'Une classe d\'agronomie', false, data_list_responsible[1]),
  Classroom(3, 'FMOS', 'assets/images/medecine.jpg','03/11/2022', 'Une classe de médecine', false, data_list_responsible[0]),
  Classroom(4, 'Géologie', 'assets/images/geologie.jpg','03/11/2022', 'une classe de géologie', true, data_list_responsible[4]),
  Classroom(5, 'TSExp', 'assets/images/img_default_class.png', '03/11/2022', 'Une classe de Biologie', true, data_list_responsible[1]),
  Classroom(6, 'GME-L2-S3', 'assets/images/informatique.jpg','03/11/2022', 'Une classe de mécanique', false, data_list_responsible[2]),
  Classroom(7, 'TSE', 'assets/images/medecine.jpg','03/11/2022', 'Une classe de mathematique et physique', false, data_list_responsible[3]),
  Classroom(8, 'TLL', 'assets/images/img_default_class.png', '03/11/2022', 'Une classe de Litérature', false, data_list_responsible[4]),
  Classroom(9, '9eme Année', 'assets/images/img_default_class.png','03/11/2022', 'Une classe de second cycle', false, data_list_responsible[1]),
  Classroom(10, 'GIT-M1-S1', 'assets/images/informatique.jpg', '03/11/2022', 'Une classe de master informatique-télécom', false, data_list_responsible[3]),
  Classroom(11, 'Artostate', 'assets/images/img_default_class.png','03/11/2022', 'Une classe de culture générale', false, data_list_responsible[2]),
  Classroom(12, 'HackaTeam', 'assets/images/hackaTeam.png', '03/11/2022', 'Une classe de hacking', false, data_list_responsible[4]),
  Classroom(13, 'Geek Academie', 'assets/images/geekacademie.png', '03/11/2022', 'Une classe de surdoué', false, data_list_responsible[0]),
   */
];
/* ========================== FIN ========================== */

/* ========================== Map des classes ========================== */
Map<int, Classroom> data_map_classrooms = {
  1:   Classroom(1, 'GIT-L3-S6', 'assets/images/informatique.jpg','02/11/2022', 'Une classe informatique', false, data_list_responsible[0]),
};
/* ========================== FIN ========================== */
