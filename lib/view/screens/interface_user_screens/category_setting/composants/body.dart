import 'package:flutter/material.dart';
import 'package:openclass/CRUD/update.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/view/composants/confirmation_alert_dialogue.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/list_salle/list_salle_page.dart';
import '../../../../../CRUD/delete.dart';
import '../../../../../model/category_salle.dart';
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
  Update update = Update();
  Delete delete = Delete();
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
                    'Parametre de la categorie',
                    Text('Enregistrer'),
                        (){
                      Navigator.of(context).pop();
                    },
                    updateCategorySalle,
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
                        children: [
                          Container(
                            color: kColorSearch,
                            child: ListTile(
                              leading: Icon(Icons.lock, color: Colors.white,),
                              title: Text("Categorie privé", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
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
                          Text("En définissant une categorie comme « privé », seuls les membres sélectionnés peuvent le voir"),
                        ],
                      ),
                      SizedBox(height: 40,),
                      InkWell(
                        child: Container(
                            height: 50,
                            color: kColorSearch,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Supprimer la catégorie", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center,),
                              ],
                            )
                        ),
                        onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ConfirmationAlertDialog(
                                title: 'Supprimer la categorie',
                                message: 'Toutes les salles et les conversations seront supprimer',
                                action: 'Supprimer',
                                press: () {
                                  delete.deleteCategorie(current_category.id_category);
                                  Navigator.pushNamed(context, ListSallePage.routeName);
                                  current_category = CategorySalle('','');
                                },
                              );
                            }
                        ),
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

  // methode de mise à jour de la category
  void updateCategorySalle()
  {
    Map<String, dynamic> new_value = Map();
    if(entryField.textController.text.isNotEmpty && entryField.multiTextController.text.isNotEmpty){
      String name_category = entryField.textController.text;
      String description_category = entryField.multiTextController.text;
      new_value = {"name_category": name_category, "description_category":description_category, "is_private":_privateCategory};
      update.updateCategorySalle(new_value);
    }
    else if(entryField.textController.text.isNotEmpty && entryField.multiTextController.text.isEmpty){
      String name_category = entryField.textController.text;
      new_value = {"name_category": name_category, "is_private":_privateCategory};
      update.updateCategorySalle(new_value);
    }
    else if(entryField.textController.text.isEmpty && entryField.multiTextController.text.isNotEmpty){
      String description_category = entryField.multiTextController.text;
      new_value = {"description_category":description_category, "is_private":_privateCategory};
      update.updateCategorySalle(new_value);
    }
    else{
      new_value = {"is_private":_privateCategory};
      update.updateCategorySalle(new_value);
    }
    Navigator.pushNamed(context, ListSallePage.routeName);
  }


}