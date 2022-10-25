import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/CRUD/create.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/view/composants/alert_dialogue.dart';
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

/// le corps de classe qui permet de créer une classe
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
      String name_classroom = entryField.textController.text;
      String default_profile = 'assets/images/img_default_class.png';

      if(name_classroom.isNotEmpty){
        // l'instance de la classe
        final classroom = Classroom(
          '',
          false,
          current_user.id,
          default_profile,
          name_classroom,
          creation_date: DateTime.now().toString(),
          description_classroom: entryField.multiTextController.text,
          is_private: _privateClassroom,
          membres: [],
        );

        final docRefClass = db.collection("classrooms").doc();
        String firebase_id_class = docRefClass.id;
        classroom.idClassroom = firebase_id_class;
        classroom.membresClassroom = [current_user.id];

        // création de la classe dans Firebase
        create.creationClassroom(classroom);


        // les instances des trois catégories de base
        final categorySalleInfo = CategorySalle('',current_classroom_id, name_category:'SALLES INFORMATION', creation_date:'${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}', description_category:'Salle de catégorie information', is_private:false, type_category:EnumCategorySalle.information);
        final categorySalleDoc = CategorySalle('', current_classroom_id,name_category:'SALLES BIBLIOTHEQUE', creation_date:'${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}', description_category:'Salle de catégorie document', is_private:false, type_category:EnumCategorySalle.bibliotheque);
        final categorySalleDis = CategorySalle('', current_classroom_id,name_category:'SALLES DISCUSSION', creation_date:'${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}', description_category:'Salle de catégorie discussion', is_private:false, type_category:EnumCategorySalle.discussion,);

        current_categories_salle_id = [];

        final docRefCatInfo = db.collection("categoriesSalles").doc();
        String firebase_id_catInfo = docRefCatInfo.id;
        categorySalleInfo.idCategory = firebase_id_catInfo;
        create.creationCategorySalle(categorySalleInfo);


        final docRefCatDoc = db.collection("categoriesSalles").doc();
        String firebase_id_catDoc = docRefCatDoc.id;
        categorySalleDoc.idCategory = firebase_id_catDoc;
        create.creationCategorySalle(categorySalleDoc);


        final docRefCatDis = db.collection("categoriesSalles").doc();
        String firebase_id_catDis = docRefCatDis.id;
        categorySalleDis.idCategory = firebase_id_catDis;
        create.creationCategorySalle(categorySalleDis);


        // les instances des trois salles
        final salleInfo = Salle('', current_categories_salle_id[0],name_salle: 'génerale', creation_date: '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}', is_private: false,);
        final salleDoc = Salle('', current_categories_salle_id[1],name_salle: 'génerale', creation_date: '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}', is_private: false,);
        final salleDis = Salle('', current_categories_salle_id[2],name_salle: 'génerale', creation_date: '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}', is_private: false,);

        final docRefSalleInfo =db.collection("salles").doc();
        String firebase_id_SalleInfo = docRefSalleInfo.id;
        salleInfo.idSalle = firebase_id_SalleInfo;
        create.creationSalle(salleInfo);

        final docRefSalleDoc = db.collection("salles").doc();
        String firebase_id_SalleDoc = docRefSalleDoc.id;
        salleDoc.idSalle = firebase_id_SalleDoc;
        create.creationSalle(salleDoc);

        final docRefSalleDis = db.collection("salles").doc();
        String firebase_id_SalleDis = docRefSalleDis.id;
        salleDis.idSalle = firebase_id_SalleDis;
        create.creationSalle(salleDis);

        // redirection vers la prochaine page en foction de la portée (privée ou public) de la classe
        (_privateClassroom == false)?Navigator.pushNamed(context, MainScreen.routeName):Navigator.pushNamed(context, AddFriendsPage.routeName);
      }

      else{
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context){
            return AlertDialogError(message: "Veuillez renseigner le nom de la classe",);
        });
      }

    }catch(e){
      print(e);
    }
  }

  // ================================= FIN =================================

}