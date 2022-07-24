import '../model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
/* ========================== Instances de l'utilisateur courant ========================== */
UserModel currentUser = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');
User? currentUserFirebabe = null;
/* ========================== FIN ========================== */

/* ========================== Instances de la classe  User ========================== */
/*
final UserModel issa = UserModel(2,'Issa', 'Kamite', 'issa@gmail.com', '77391909', 'assets/images/img_default_person.png', '1234', '12/02/2022');
final UserModel ibg = UserModel(3,'Ibrahime dit Bakoroba', 'Goumané', 'moussa@gmail.com', '66390178', 'assets/images/medecine.jpg', '4324', '12/03/2022');
final UserModel abdoulaye = UserModel(4,'Abdoulaye', 'Sacko', 'sacko@gmail.com', '77391909', 'assets/images/geologie.jpg', 'FR241', '12/02/2022');
final UserModel togola = UserModel(5,'Nouhoun', 'Soumare', 'togola@gmail.com', '77391909', 'assets/images/img_default_person.png', 'JK98', '12/04/2022');
final UserModel ousmane = UserModel(6,'Ousmane', 'Sanogo', 'ousmane@gmail.com', '77391909', 'assets/images/informatique.jpg', '5413', '12/05/2022');
final UserModel adama = UserModel(7,'Adama', 'Cisse', 'adama@gmail.com', '77391909', 'assets/images/medecine.jpg', '7642', '12/02/2022');
final UserModel baissa = UserModel(8,'Issa', 'Coulibaly', 'baissa@gmail.com', '77391909', 'assets/images/img_default_person.png', '43256143', '12/06/2022');
final UserModel hassane = UserModel(9,'Hassane', 'Sidibe', 'hassane@gmail.com', '77391909', 'assets/images/img_default_person.png', '643245', '12/07/2022');
final UserModel sougoule = UserModel(10,'Souleymane', 'Sougoule', 'sougoule@gmail.com', '77391909', 'assets/images/informatique.jpg', '4625', '12/08/2022');
final UserModel alhousseyni = UserModel(11,'Alhousseyni', 'Maiga', 'maiga@gmail.com', '77391909', 'assets/images/img_default_person.png', '9087', '12/09/2022');
final UserModel ibrahim = UserModel(12,'Ibrahime', 'Traore', 'bolo@gmail.com', '77391909', 'assets/images/hackaTeam.png', 'huug-è(', '12/10/2022');
final UserModel sow = UserModel(13,'Aliou', 'Sow', 'sow@gmail.com', '77391909', 'assets/images/geekacademie.png', '0000', '12/11/2022');
final UserModel boubacar = UserModel(14,'Boubacar', 'Diarra', 'boubacar@gmail.com', '77391909', 'assets/images/img_default_person.png', '1234', '12/12/2022');

 */
UserModel issa = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');
UserModel ibg = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');
UserModel abdoulaye = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');
UserModel togola = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');
UserModel ousmane = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');
UserModel adama = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');
UserModel baissa = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');
UserModel hassane = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');
UserModel sougoule = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');
UserModel alhousseyni = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');
UserModel ibrahim = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');
UserModel sow = UserModel(id: '1',first_name: 'Drissa Sidiki', last_name: 'Traore', email: 'drissa7219@gmail.com', tel_number: '72196636', img_profile: 'assets/images/informatique.jpg', password: '65', date_birth: '12/01/2022');

/* ========================== FIN ========================== */
