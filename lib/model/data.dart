import 'package:openclass/model/enum_category_salle.dart';
import 'package:openclass/model/user.dart';
import 'package:openclass/model/message.dart';
import 'package:openclass/model/salle.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/model/classroom.dart';

final User issa = User(2,'Issa', 'Kamite', 'issa@gmail.com', '77391909', 'assets/images/img_default_person.png');
final User moussa = User(3,'Moussa', 'Coulibaly', 'moussa@gmail.com', '66390178', 'assets/images/medecine.jpg');
final User abdoulaye = User(4,'Abdoulaye', 'Sacko', 'sacko@gmail.com', '77391909', 'assets/images/geologie.jpg');
final User togola = User(5,'Nouhoun', 'Soumare', 'togola@gmail.com', '77391909', 'assets/images/img_default_person.png');
final User ousmane = User(6,'Ousmane', 'Sanogo', 'ousmane@gmail.com', '77391909', 'assets/images/informatique.jpg');
final User adama = User(7,'Adama', 'Cisse', 'adama@gmail.com', '77391909', 'assets/images/medecine.jpg');
final User baissa = User(8,'Issa', 'Coulibaly', 'baissa@gmail.com', '77391909', 'assets/images/img_default_person.png');
final User hassane = User(9,'Hassane', 'Sidibe', 'hassane@gmail.com', '77391909', 'assets/images/img_default_person.png');
final User sougoule = User(10,'Souleymane', 'Sougoule', 'sougoule@gmail.com', '77391909', 'assets/images/informatique.jpg');
final User alhousseyni = User(11,'Alhousseyni', 'Maiga', 'maiga@gmail.com', '77391909', 'assets/images/img_default_person.png');
final User ibrahim = User(12,'Ibrahime', 'Traore', 'bolo@gmail.com', '77391909', 'assets/images/hackaTeam.png');
final User sow = User(13,'Aliou', 'Sow', 'sow@gmail.com', '77391909', 'assets/images/geekacademie.png');
final User boubacar = User(14,'Boubacar', 'Diarra', 'boubacar@gmail.com', '77391909', 'assets/images/img_default_person.png');
final User badri = User(1,'Drissa Sidiki', 'Traore', 'drissa7219@gmail.com', '72196636', 'assets/images/informatique.jpg');

// Exemple de message
List<Message> messages = [
  Message(badri,issa, '12:23', 'Tu vas à l\'école demain', false, false),
  Message(badri,moussa, '10:21', 'Le document que tu ma envoyer est très interessant, merci', true, true),
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

// Exemple de classe
List<Classroom> classrooms = [

  Classroom(1, 'GIT-L3-S6', 'assets/images/informatique.jpg'),
  Classroom(2, 'Hyper', 'assets/images/img_default_class.png'),
  /*
  Classroom(3, 'FMOS', 'assets/images/medecine.jpg', categories_salle),
  Classroom(4, 'Géologie', 'assets/images/geologie.jpg', categories_salle),
  Classroom(5, 'TSExp', 'assets/images/img_default_class.png', categories_salle),
  Classroom(6, 'GME-L2-S3', 'assets/images/informatique.jpg', categories_salle),
  Classroom(7, 'TSE', 'assets/images/medecine.jpg', categories_salle),
  Classroom(8, 'TLL', 'assets/images/img_default_class.png', categories_salle),
  Classroom(9, '9eme Année', 'assets/images/img_default_class.png', categories_salle),
  Classroom(10, 'GIT-M1-S1', 'assets/images/informatique.jpg', categories_salle),
  Classroom(11, 'Artostate', 'assets/images/img_default_class.png', categories_salle),
  Classroom(12, 'HackaTeam', 'assets/images/hackaTeam.png', categories_salle),
  Classroom(13, 'Geek Academie', 'assets/images/geekacademie.png', categories_salle),

  */
];

// Les categories de base
final CategorySalle information = CategorySalle(1, EnumCategorySalle.information,list_salle_info);
final CategorySalle bibliotheque = CategorySalle(2, EnumCategorySalle.bibliotheque, list_salle_biblio);
final CategorySalle discussion = CategorySalle(3, EnumCategorySalle.discussion, list_salle_discussion);

List<CategorySalle> categories_salle = [information, bibliotheque, discussion];

// Liste des salles information
List<Salle> list_salle_info = [

  Salle(1, 'géneral', ),
  Salle(2, 'informatique', ),
  Salle(3, 'télécom', ),


];
// Liste des salle bibliotheque
List<Salle> list_salle_biblio = [

  Salle(4, 'géneral', ),


];
// Liste des salles discussion
List<Salle> list_salle_discussion = [
  Salle(7, 'géneral',),

];

// Exemple de salle
final Salle information_general = Salle(1, 'géneral', );
/*
final Salle informationn_informatique = Salle(2, 'informatique', information);
final Salle information_telecom = Salle(3, 'télécom', information);

final Salle bibliotheque_general = Salle(4, 'géneral', bibliotheque);
final Salle bibliotheque_informatique = Salle(5, 'informatique', bibliotheque);
final Salle bibliotheque_telecom = Salle(6, 'télécom', bibliotheque);

final Salle discussion_general = Salle(7, 'géneral', discussion);
final Salle discussion_informatique = Salle(8, 'informatique', discussion);
final Salle discussion_telecom = Salle(9, 'télécom', discussion);

 */




