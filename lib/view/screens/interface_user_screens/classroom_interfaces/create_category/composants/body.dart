import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/join_classroom/composants/body.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/join_classroom/composants/choose_classe_categorie.dart';

import '../../../../../composants/entry_field.dart';
import '../../../../../constante.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}
enum _choixCategorieSalle {discussion, bibliotheque, information}
class _BodyState extends State<Body>
{
  _choixCategorieSalle? _categorieSalle = _choixCategorieSalle.discussion;
  bool _privateSalle = false;
  @override
  build(BuildContext context)
  {
    return Container(
      color: kColorAppBar,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 30),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Nom de la salle", style: TextStyle(fontSize: 18),),
                EntryField.buildTextFiel(),
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
                Text("En définissant une catégorie comme « privé », seules les personnes sélectionnées pourront la voir."),
              ],
            ),
          ],
        ),
      ),
    );
  }
}