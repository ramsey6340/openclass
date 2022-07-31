import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/CRUD/create.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import '../../../../../../model/salle.dart';
import '../../../../../composants/entry_field.dart';
import '../../../../../constante.dart';
import '../../../main_screen.dart';
import '../../add_friends/add_friends_page.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();

}
class _BodyState extends State<Body>
{
  final entryField = EntryField();
  bool _privateSalle = false;
  Create create = Create();
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
                creationOfSalle,
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

  // =================================methode de creation d'une salle=================================
  void creationOfSalle()
  {
    try{
      FirebaseFirestore db = FirebaseFirestore.instance;

      // creation d'un id pour la salle
      final salle11 = entryField.textController.text.trim();
      final lsalle1 = current_user.email.split('@');
      final salle12 = lsalle1[0];
      final salle13 = current_user.tel_number;
      final salle14 = current_user.password;
      final listsalle1 = [salle11,salle12,salle13,salle14];
      final id_salle = listsalle1.join();

      // creation d'une instance de la salle
      final salle = Salle(
          id_salle,
          current_category.id_category,
          name_salle: entryField.textController.text,
          creation_date: '',
          is_private: _privateSalle,
      );

      final docRefSalle = db.collection("salles").doc(salle.category_salle_id).collection(salle.category_salle_id).doc();
      String firebase_id_Salle = docRefSalle.id;
      salle.idSalle = firebase_id_Salle;

      // création de la salle dans Firebase
      create.creationSalle(salle);

      // redirection vers la prochaine page en fonction de la portée (privée ou public) de la salle
      if(_privateSalle == false){
        Navigator.pushNamed(context, MainScreen.routeName);
        // le drawer ne souvre pas, cherche une solution
        Scaffold.of(context).openEndDrawer();
      }
      else{
        Navigator.pushNamed(context, AddFriendsPage.routeName);
      }

    }catch(e){
      print(e);
    }
  }
  // ================================= FIN =================================

}