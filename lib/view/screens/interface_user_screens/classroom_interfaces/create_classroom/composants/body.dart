import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/CRUD/create.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/view/composants/external_link.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import '../../../../../../model/classroom.dart';
import '../../../../../../model/enum_type.dart';
import '../../../../../../model/salle.dart';
import '../../add_friends/add_friends_page.dart';
import 'choose_picture_class.dart';
import '../../../../../composants/entry_field.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  final entryField = EntryField();
  bool _privateClassroom = false;
  Create create = Create();
  @override
  build(BuildContext context)
  {
    Icon? suffixIconCross;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
        children: [
          Text("Créer une classe", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
          SizedBox(height: 50,),
          ChoosePictureClass(imgClass: null),
          SizedBox(height: 50,),
          Text("Nom de la classe", style: TextStyle(fontSize: 18),),
          entryField.buildTextField(),
          SizedBox(height: 20,),
          Text("Description de la classe", style: TextStyle(fontSize: 18),),
          entryField.buildMultiTextField(),
          SizedBox(height: 20,),
          Container(
            color: kColorSearch,
            child: ListTile(
              leading: Icon(Icons.lock, color: Colors.white,),
              title: Text("Classe privé", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
              trailing: Switch(
                activeColor: Colors.green,
                value: _privateClassroom,
                onChanged: (value){
                  setState((){
                    _privateClassroom = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 5,),
          Text("En définissant une classe comme « privé », seuls les personnes directement inviter par vous peuvent y acceder"),
          SizedBox(height: 20,),
          Row(
            children: [
              Text("En créant une classe, tu accepte la ", style: TextStyle(fontSize: 16),),
              ExternalLink(color: kColorPrimary, text: "Politique", destination: ''),
            ],
          ),
          ExternalLink(color: kColorPrimary, text: "d'utilisation de OpenClass", destination: ''),
          SizedBox(height: 80,),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 50),
            child: NextButton(
                color: kColorPrimary,
                text: 'Créer une classe',
                press: creationOfClassroom,
            ),
          ),
        ],
      ),
    );
  }


  // =================================methode de creation d'une classe=================================
  void creationOfClassroom()
  {
    try{
      FirebaseFirestore db = FirebaseFirestore.instance;

      // creation d'un id pour la classe
      final v1 = entryField.textController.text.trim().toUpperCase();
      final l = current_user.email.split('@');
      final v2 = l[0];
      final v3 = current_user.tel_number;
      final v4 = current_user.password;
      final list = [v1,v2,v3,v4];
      final id_classroom = list.join();

      // l'instance de la classe
      final classroom = Classroom(
        id_classroom,
        current_user.id,
        name_classroom: entryField.textController.text,
        img_profile: 'assets/images/img_default_class.png',
        creation_date: '',
        description_classroom: entryField.multiTextController.text,
        is_private: _privateClassroom,
      );

      final docRefClass = db.collection("classrooms").doc(classroom.responsible_id).collection(classroom.responsible_id).doc();
      String firebase_id_class = docRefClass.id;
      classroom.idClassroom = firebase_id_class;


      // création de la classe dans Firebase
      create.creationClassroom(classroom);

      // creation d'un id pour la categorie 1
      final cat11 = 'SALLESINFORMATION';
      final lcat1 = current_user.email.split('@');
      final cat12 = lcat1[0];
      final cat13 = current_user.tel_number;
      final cat14 = current_user.password;
      final listcat1 = [cat11,cat12,cat13,cat14];
      final id_categorie1 = listcat1.join();

      // creation d'un id pour la categorie 2
      final cat21 = 'SALLESBIBLIOTHEQUE';
      final lcat2 = current_user.email.split('@');
      final cat22 = lcat2[0];
      final cat23 = current_user.tel_number;
      final cat24 = current_user.password;
      final listcat2 = [cat21,cat22,cat23,cat24];
      final id_categorie2 = listcat2.join();

      // creation d'un id pour la categorie 3
      final cat31 = 'SALLESDISCUSSION';
      final lcat3 = current_user.email.split('@');
      final cat32 = lcat3[0];
      final cat33 = current_user.tel_number;
      final cat34 = current_user.password;
      final listcat3 = [cat31,cat32,cat33,cat34];
      final id_categorie3 = listcat3.join();


      // les instances des trois catégories de base
      final categorySalleInfo = CategorySalle(id_categorie1,current_classroom_id, name_category:'SALLES INFORMATION', creation_date:'', description_category:'Salle de catégorie information', is_private:false, type_category:EnumCategorySalle.information);
      final categorySalleDoc = CategorySalle(id_categorie2, current_classroom_id,name_category:'SALLES BIBLIOTHEQUE', creation_date:'', description_category:'Salle de catégorie document', is_private:false, type_category:EnumCategorySalle.bibliotheque);
      final categorySalleDis = CategorySalle(id_categorie3, current_classroom_id,name_category:'SALLES DISCUSSION', creation_date:'', description_category:'Salle de catégorie discussion', is_private:false, type_category:EnumCategorySalle.discussion,);

      final docRefCatInfo = db.collection("categoriesSalles").doc(categorySalleInfo.classroom_id).collection(categorySalleInfo.classroom_id).doc();
      final docRefCatDoc = db.collection("categoriesSalles").doc(categorySalleInfo.classroom_id).collection(categorySalleInfo.classroom_id).doc();
      final docRefCatDis = db.collection("categoriesSalles").doc(categorySalleInfo.classroom_id).collection(categorySalleInfo.classroom_id).doc();

      String firebase_id_catInfo = docRefCatInfo.id;
      String firebase_id_catDoc = docRefCatDoc.id;
      String firebase_id_catDis = docRefCatDis.id;

      categorySalleInfo.idCategory = firebase_id_catInfo;
      categorySalleDoc.idCategory = firebase_id_catDoc;
      categorySalleDis.idCategory = firebase_id_catDis;

      // on rend vide la variable current_categories_salle_id pour s'assurer qu'on aura bien que trois id de catégorie à manipuler
      current_categories_salle_id = [];

      // création des trois catégories de base dans Firebase
      create.creationCategorySalle(categorySalleInfo);
      create.creationCategorySalle(categorySalleDoc);
      create.creationCategorySalle(categorySalleDis);

      // creation d'un id pour la salle 1
      final salle11 = 'géneral';
      final lsalle1 = current_user.email.split('@');
      final salle12 = lsalle1[0];
      final salle13 = current_user.tel_number;
      final salle14 = current_user.password;
      final listsalle1 = [salle11,salle12,salle13,salle14];
      final id_salle1 = listsalle1.join();

      // creation d'un id pour la salle 2
      final salle21 = 'géneral';
      final lsalle2 = current_user.email.split('@');
      final salle22 = lsalle2[0];
      final salle23 = current_user.tel_number;
      final salle24 = current_user.password;
      final listsalle2 = [salle21,salle22,salle23,salle24];
      final id_salle2 = listsalle2.join();

      // creation d'un id pour la salle 3
      final salle31 = 'géneral';
      final lsalle3 = current_user.email.split('@');
      final salle32 = lsalle3[0];
      final salle33 = current_user.tel_number;
      final salle34 = current_user.password;
      final listsalle3 = [salle31,salle32,salle33,salle34];
      final id_salle3 = listsalle3.join();

      // les instances des trois salles
      final salleInfo = Salle(id_salle1, current_categories_salle_id[0],name_salle: 'géneral', creation_date: '', is_private: false,);
      final salleDoc = Salle(id_salle2, current_categories_salle_id[1],name_salle: 'géneral', creation_date: '', is_private: false,);
      final salleDis = Salle(id_salle3, current_categories_salle_id[2],name_salle: 'géneral', creation_date: '', is_private: false,);

      final docRefSalleInfo =db.collection("salles").doc(salleInfo.category_salle_id).collection(salleInfo.category_salle_id).doc();
      final docRefSalleDoc = db.collection("salles").doc(salleDoc.category_salle_id).collection(salleDoc.category_salle_id).doc();
      final docRefSalleDis = db.collection("salles").doc(salleDis.category_salle_id).collection(salleDis.category_salle_id).doc();

      String firebase_id_SalleInfo = docRefSalleInfo.id;
      String firebase_id_SalleDoc = docRefSalleDoc.id;
      String firebase_id_SalleDis = docRefSalleDis.id;

      salleInfo.idSalle = firebase_id_SalleInfo;
      salleDoc.idSalle = firebase_id_SalleDoc;
      salleDis.idSalle = firebase_id_SalleDis;

      // création d'une salle pour chacun des trois catégories dans Firebase
      create.creationSalle(salleInfo);
      create.creationSalle(salleDoc);
      create.creationSalle(salleDis);

      // redirection vers la prochaine page en foction de la portée (privée ou public) de la classe
      (_privateClassroom == false)?Navigator.pushNamed(context, MainScreen.routeName):Navigator.pushNamed(context, AddFriendsPage.routeName);
    }catch(e){
      print(e);
    }
  }
  // ================================= FIN =================================

}