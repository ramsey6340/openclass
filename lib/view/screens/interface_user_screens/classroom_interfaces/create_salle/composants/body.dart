import 'package:flutter/material.dart';
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
  bool privateSalle = false;
  _choixCategorieSalle? _categorieSalle = _choixCategorieSalle.discussion;
 // bool _privateSalle = false;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Catégorie de la salle", style: TextStyle(fontSize: 18),),
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
                      value: privateSalle,
                      onChanged: (value){
                        setState((){
                          privateSalle = value;
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
    );
  }
}