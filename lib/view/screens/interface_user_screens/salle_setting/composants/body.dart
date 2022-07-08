import 'package:flutter/material.dart';
import 'package:openclass/view/composants/interaction_next_component.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/list_salle/list_salle_page.dart';
import 'package:openclass/view/screens/interface_user_screens/salle_setting/composants/change_category.dart';
import '../../../../composants/entry_field.dart';
import '../../../../constante.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  final entryField = EntryField();
  bool _privateCategory = false;
  @override
  build(BuildContext context)
  {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: ToolsBar.falseAppBar(
                Text('Annuler'),
                'Parametre de la salle',
                Text('Enregistrer'),
                    (){
                  Navigator.of(context).pop();
                },
                    (){
                  Navigator.pushNamed(context, ListSallePage.routeName);
                }
            ),
          ),
          Expanded(
            child: Container(
              color: kColorAppBar,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Nom de la salle", style: TextStyle(fontSize: 18),),
                        entryField.buildTextField(),
                      ],
                    ),
                    SizedBox(height: 40,),
                    InteractionComponent(title: 'catégorie', press: (){Navigator.pushNamed(context, ChangeCategory.routeName);}),
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
                    SizedBox(height: 40,),
                    GestureDetector(
                      child: Container(
                          height: 50,
                          color: kColorSearch,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Supprimer la salle", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center,),
                            ],
                          )
                      ),
                      onTap: (){},
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

}