import 'package:flutter/material.dart';
import 'package:openclass/data/data_salle.dart';
import 'package:openclass/increment.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import '../../../../../../model/salle.dart';
import '../../../../../composants/entry_field.dart';
import '../../../../../constante.dart';
import '../../../main_screen.dart';
import '../../add_friends/add_friends_page.dart';

class Body extends StatefulWidget
{
  Body({Key?key, required this.categorySalle}):super(key: key);
  final CategorySalle categorySalle;
  @override
  State<Body> createState() => _BodyState();

}
class _BodyState extends State<Body>
{
  final entryField = EntryField();
  bool _privateSalle = false;
  @override
  build(BuildContext context)
  {
    return Container(
      color: kColorAppBar,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Column(
          children: [
            ToolsBar.falseAppBar(
                  Text('Annuler',style: TextStyle(fontSize: 16,)),
                'Créer une salle',
                (_privateSalle == false)?Text('Créer',style: TextStyle(fontSize: 18,)):Text('Suivant',style: TextStyle(fontSize: 18,)),
                (){
                  Navigator.pushNamed(context, MainScreen.routeName);
                },
                (){
                  createSalle(entryField.textController.text, _privateSalle, widget.categorySalle);
                  if(_privateSalle == false){
                    Navigator.pushNamed(context, MainScreen.routeName);
                    // le drawer ne souvre pas, cherche une solution
                    Scaffold.of(context).openEndDrawer();
                  }
                  else{
                    Navigator.pushNamed(context, AddFriendsPage.routeName);
                  }
                  //(_privateSalle == false)?Navigator.pushNamed(context, MainScreen.routeName):Navigator.pushNamed(context, AddFriendsPage.routeName);
                }
            ),
            Expanded(
                child: ListView(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Nom de la salle", style: TextStyle(fontSize: 18),),
                        entryField.buildTextField(),
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
                              value: _privateSalle,
                              onChanged: (value){
                                setState((){
                                  _privateSalle = value;
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
  void createSalle(String name, bool is_private, CategorySalle categorySalle)
  {
    Salle salle = Salle(Increment.idSalle, name, '12/12/2019', is_private, categorySalle);
    data_list_salles.add(salle);
  }

}