import 'enum_type.dart';
import 'package:openclass/model/user.dart';
import 'package:openclass/model/message.dart';
import 'package:openclass/model/salle.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/model/classroom.dart';
import 'discussion.dart';
import 'information.dart';
import 'document.dart';
import 'my_action.dart';


/* ========================== Instances de la classe  Discussion ========================== */
Discussion discussion = Discussion(1, 'contente', '12/03/2021', issa);
/* ========================== FIN ========================== */

/* ========================== Instances de la classe  Information ========================== */
Information information = Information(2, 'contente', '02/12/2022', ibg);
/* ========================== FIN ========================== */

/* ========================== Instances de la classe  Information ========================== */
Document document = Document(3, '', '31/06/2022', ousmane);

List<MyAction> my_actions = [discussion, information, document];
/* ========================== FIN ========================== */

/* ========================== Instances de la classe  User ========================== */
final User issa = User(2,'Issa', 'Kamite', 'issa@gmail.com', '77391909', 'assets/images/img_default_person.png', '1234', '12/02/2022', true, true, /*classrooms, my_actions*/);
final User ibg = User(3,'Ibrahime dit Bakoroba', 'Goumané', 'moussa@gmail.com', '66390178', 'assets/images/medecine.jpg', '4324', '12/03/2022', false, true, /*classrooms, my_actions*/);
final User abdoulaye = User(4,'Abdoulaye', 'Sacko', 'sacko@gmail.com', '77391909', 'assets/images/geologie.jpg', 'FR241', '12/02/2022', false, false, /*classrooms, my_actions*/);
final User togola = User(5,'Nouhoun', 'Soumare', 'togola@gmail.com', '77391909', 'assets/images/img_default_person.png', 'JK98', '12/04/2022', true, true, /*classrooms, my_actions*/);
final User ousmane = User(6,'Ousmane', 'Sanogo', 'ousmane@gmail.com', '77391909', 'assets/images/informatique.jpg', '5413', '12/05/2022', false, true, /*classrooms, my_actions*/);
final User adama = User(7,'Adama', 'Cisse', 'adama@gmail.com', '77391909', 'assets/images/medecine.jpg', '7642', '12/02/2022', false, false, /*classrooms, my_actions*/);
final User baissa = User(8,'Issa', 'Coulibaly', 'baissa@gmail.com', '77391909', 'assets/images/img_default_person.png', '43256143', '12/06/2022', true, true, /*classrooms, my_actions*/);
final User hassane = User(9,'Hassane', 'Sidibe', 'hassane@gmail.com', '77391909', 'assets/images/img_default_person.png', '643245', '12/07/2022', false, true, /*classrooms, my_actions*/);
final User sougoule = User(10,'Souleymane', 'Sougoule', 'sougoule@gmail.com', '77391909', 'assets/images/informatique.jpg', '4625', '12/08/2022', false, false, /*classrooms, my_actions*/);
final User alhousseyni = User(11,'Alhousseyni', 'Maiga', 'maiga@gmail.com', '77391909', 'assets/images/img_default_person.png', '9087', '12/09/2022', true, true, /*classrooms, my_actions*/);
final User ibrahim = User(12,'Ibrahime', 'Traore', 'bolo@gmail.com', '77391909', 'assets/images/hackaTeam.png', 'huug-è(', '12/10/2022', false, true, /*classrooms, my_actions*/);
final User sow = User(13,'Aliou', 'Sow', 'sow@gmail.com', '77391909', 'assets/images/geekacademie.png', '0000', '12/11/2022', false, false, /*classrooms, my_actions*/);
final User boubacar = User(14,'Boubacar', 'Diarra', 'boubacar@gmail.com', '77391909', 'assets/images/img_default_person.png', '1234', '12/12/2022', true, true, /*classrooms, my_actions*/);
final User badri = User(1,'Drissa Sidiki', 'Traore', 'drissa7219@gmail.com', '72196636', 'assets/images/informatique.jpg', '65', '12/01/2022', false, true, /*classrooms, my_actions*/);
/* ========================== FIN ========================== */

/* ========================== Instances de la classe  Message ========================== */
List<Message> messages = [
  Message(badri,issa, '12:23', 'Tu vas à l\'école demain', false, false),
  Message(badri,ibg, '10:21', 'Le document que tu ma envoyer est très interessant, merci', true, true),
  Message(badri,abdoulaye, '02:21', 'effectivement tu as raison, je vais essayer de voir ce que je peux faire avant Lundi', false, true),
  Message(badri,togola, '12:20', 'Salut le petit scarabet', true, true),
  Message(badri,ousmane, '12:32', 'Tu es trop génial Drissa, et moi je suis un pétit', false, false),
  Message(badri,adama, '08:21', 'Waleykoum salam couz, comment tu vas ?', false, false),
  Message(badri,baissa, '10:11', 'Incha Allah', false, false),
  Message(badri,hassane, '23:21', 'Amine mon frère', true, true),
  Message(badri,sougoule, '21:02', 'Vraiment tu ma laissé', true, false),
  Message(badri,alhousseyni, '16:02', 'Petit', true, true),
  Message(badri,ibrahim, '18:40', 'Il as dit qu\'on vas avancer en cour', true, false),
  Message(badri,sow, '12:03', 'ok on fait comme ça', true, true),
  Message(badri,boubacar, '06:09', 'Salamou aleykoum', true, true),
];
/* ========================== FIN ========================== */

/* ========================== Instances de la classe  Classroom ========================== */
List<Classroom> classrooms = [
  Classroom(1, 'GIT-L3-S6', 'assets/images/informatique.jpg','03/11/2022', 'Une classe informatique-télécom', /*list_categories_salle*/ issa),
  Classroom(2, 'Hyper', 'assets/images/img_default_class.png','03/11/2022', 'Une classe d\'agronomie', /*list_categories_salle*/ togola),
  Classroom(3, 'FMOS', 'assets/images/medecine.jpg','03/11/2022', 'Une classe de médecine', /*list_categories_salle,*/ baissa),
  Classroom(4, 'Géologie', 'assets/images/geologie.jpg','03/11/2022', 'une classe de géologie', /*list_categories_salle,*/ sow),
  Classroom(5, 'TSExp', 'assets/images/img_default_class.png', '03/11/2022', 'Une classe de Biologie', /*list_categories_salle,*/ boubacar),
  Classroom(6, 'GME-L2-S3', 'assets/images/informatique.jpg','03/11/2022', 'Une classe de mécanique', /*list_categories_salle,*/ togola),
  Classroom(7, 'TSE', 'assets/images/medecine.jpg','03/11/2022', 'Une classe de mathematique et physique', /*list_categories_salle,*/ baissa),
  Classroom(8, 'TLL', 'assets/images/img_default_class.png', '03/11/2022', 'Une classe de Litérature', /*list_categories_salle,*/ sow),
  Classroom(9, '9eme Année', 'assets/images/img_default_class.png','03/11/2022', 'Une classe de second cycle', /*list_categories_salle,*/ boubacar),
  Classroom(10, 'GIT-M1-S1', 'assets/images/informatique.jpg', '03/11/2022', 'Une classe de master informatique-télécom', /*list_categories_salle,*/ issa),
  Classroom(11, 'Artostate', 'assets/images/img_default_class.png','03/11/2022', 'Une classe de culture générale', /*list_categories_salle,*/ togola),
  Classroom(12, 'HackaTeam', 'assets/images/hackaTeam.png', '03/11/2022', 'Une classe de hacking', /*list_categories_salle,*/ baissa),
  Classroom(13, 'Geek Academie', 'assets/images/geekacademie.png', '03/11/2022', 'Une classe de surdoué', /*list_categories_salle,*/ sow),
];
/* ========================== FIN ========================== */

/* ========================== Instances de la classe  Salle ========================== */
List<Salle> list_salle_info = [
  Salle(1, 'géneral', '02/02/2022', information_cat, information),
  Salle(2, 'informatique', '02/02/2022', information_cat, information),
  Salle(3, 'télécom', '02/02/2022', information_cat, information),
];

List<Salle> list_salle_biblio = [
  Salle(4, 'géneral', '02/02/2022', bibliotheque_cat, document),
  Salle(4, 'documents informatique', '02/02/2022', bibliotheque_cat, document),
  Salle(4, 'documents télécom', '02/02/2022', bibliotheque_cat, document),
];

List<Salle> list_salle_discussion = [
  Salle(7, 'géneral', '02/02/2022', discussion_cat, discussion),
  Salle(7, 'discussion informatique', '02/02/2022', discussion_cat, discussion),
  Salle(7, 'discussion télécom', '02/02/2022', discussion_cat, discussion),
];

/* ========================== FIN ========================== */

/* ========================== Instances de la classe  CategorySalle ========================== */
final CategorySalle information_cat = CategorySalle(1, 'SALLES INFORMATION', '12/02/2022','Salle de catégorie information', EnumCategorySalle.information/*,list_salle_info*/, classrooms[0]);
final CategorySalle bibliotheque_cat = CategorySalle(2, 'SALLES BIBLIOTHEQUE', '12/02/2022','Salle de catégorie document', EnumCategorySalle.bibliotheque/*,list_salle_biblio*/, classrooms[0]);
final CategorySalle discussion_cat = CategorySalle(3, 'SALLES DISCUSSION', '12/02/2022','Salle de catégorie discussion', EnumCategorySalle.discussion/*,list_salle_discussion*/, classrooms[0]);
final CategorySalle coranique_cat = CategorySalle(3, 'SALLES CORANIQUE', '12/02/2022','Salle de catégorie lecture de coran', EnumCategorySalle.discussion/*,list_salle_discussion*/, classrooms[0]);

List<CategorySalle> list_categories_salle = [information_cat, bibliotheque_cat, discussion_cat, coranique_cat];
/* ========================== FIN ========================== */



