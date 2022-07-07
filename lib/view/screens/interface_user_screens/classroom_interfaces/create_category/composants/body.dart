import 'package:flutter/material.dart';
import 'package:openclass/data/data_category_salle.dart';
import 'package:openclass/increment.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/model/classroom.dart';
import 'package:openclass/model/enum_type.dart';
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
  ChooseClasseCategorie chooseClasseCategorie = ChooseClasseCategorie();
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
                  Navigator.pushNamed(context, MainScreen.routeName);
                },
                (){
                  createClassroom(entryField.textController.text, entryField.multiTextController.text, _privateCategory, chooseClasseCategorie.categoryChoose, widget.classroom);
                  (_privateCategory == false)?Navigator.pushNamed(context, MainScreen.routeName):Navigator.pushNamed(context, AddFriendsPage.routeName);
                }
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

  // methode de creation d'une instance de la classe Salle
  void createClassroom(String name, String description, bool is_private, EnumCategorySalle type, Classroom classroom)
  {
    CategorySalle categorySalle = CategorySalle(Increment.idCategory, name, '12/12/2022', description, is_private, type, classroom);
    data_List_categories_salle.add(categorySalle);
  }
}