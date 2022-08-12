import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/CRUD/create.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/model/classroom.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import '../../../main_screen.dart';
import '../../add_friends/add_friends_page.dart';
import '../../../../../composants/choose_classe_categorie.dart';
import '../../../../../composants/entry_field.dart';
import '../../../../../constante.dart';

class Body extends StatefulWidget
{
  Body({Key? key, required this.classroom}):super(key: key);
  final Classroom classroom;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  final entryField = EntryField();
  bool _privateCategory = false;
  Create create = Create();
  @override
  build(BuildContext context)
  {
    return Container(
      color: kColorAppBar,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ToolsBar.falseAppBar(
                Text('Annuler',style: TextStyle(fontSize: 18,)),
                'Créer une categorie',
                (_privateCategory == false)?Text('Créer',style: TextStyle(fontSize: 18,)):Text('Suivant',style: TextStyle(fontSize: 18,)),
                (){
                  Navigator.of(context).pop();
                },
                creationOfCategory,// la methode à appeler pour le traitement
            ),

            Expanded(
                child: ListView(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Nom de la categorie", style: TextStyle(fontSize: 18),),
                        entryField.buildTextField(),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Description de la categorie", style: TextStyle(fontSize: 18),),
                        entryField.buildMultiTextField(),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Type de la categorie", style: TextStyle(fontSize: 18),),
                        SizedBox(height: 5,),
                        ChooseClasseCategorie(),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Column(
                      children: [
                        Container(
                          color: kColorSearch,
                          child: ListTile(
                            leading: Icon(Icons.lock, color: Colors.white,),
                            title: Text("Salle privé", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                            trailing: Switch(
                              activeColor: Colors.green,
                              value: _privateCategory,
                              onChanged: (value){
                                setState((){
                                  _privateCategory = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text("En définissant une salle comme « privé », seuls les membres sélectionnés peuvent le voir"),
                      ],
                    ),
                  ],
                ),
            ),

          ],
        ),
      ),
    );
  }


  // =================================methode de création d'une catégorie=================================
  Future<void> creationOfCategory() async
  {
    try{
      FirebaseFirestore db = FirebaseFirestore.instance;
      // creation d'un id pour la categorie
      final cat11 = entryField.textController.text.trim();
      final lcat1 = current_user.email.split('@');
      final cat12 = lcat1[0];
      final cat13 = current_user.tel_number;
      final cat14 = current_user.password;
      final listcat1 = [cat11,cat12,cat13,cat14];
      final id_categorie = listcat1.join();


      // creation d'une instance de la categorie
      final category = CategorySalle(
        id_categorie,
        current_classroom.id_classroom,
        name_category: entryField.textController.text,
        creation_date: '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}',
        description_category: entryField.multiTextController.text,
        is_private: _privateCategory,
        type_category: ChooseClasseCategorie.categoryChoose,
      );

      //final docRefCat = db.collection("categoriesSalles").doc(category.classroom_id).collection(category.classroom_id).doc();
      final docRefCat = db.collection("categoriesSalles").doc();

      String firebase_id_cat = docRefCat.id;
      category.idCategory = firebase_id_cat;

      // création de la catégorie dans Firebase
      create.creationCategorySalle(category);

      // redirection vers la prochaine page en fonction de la portée (privée ou public) de la catégorie
      (_privateCategory == false)?Navigator.pushNamed(context, MainScreen.routeName):Navigator.pushNamed(context, AddFriendsPage.routeName);

    }catch(e){
      print(e);
    }
  }
  // ================================= FIN =================================

}