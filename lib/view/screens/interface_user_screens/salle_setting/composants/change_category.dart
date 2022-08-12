import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:openclass/CRUD/update.dart';
import 'package:openclass/data/data_current.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/view/composants/category_item.dart';
import '../../../../composants/loading.dart';
import '../../../../composants/tools_bar.dart';
import '../../../../constante.dart';

class ChangeCategory extends StatefulWidget
{
  static String routeName = '/change_category';
  var init_category_id = current_salle.category_salle_id;
  @override
  State<ChangeCategory> createState() => _ChangeCategoryState();
}

class _ChangeCategoryState extends State<ChangeCategory>
{
  Update update = Update();
  String val = '';
  @override
  Widget build(BuildContext context)
  {
    FirebaseFirestore db = FirebaseFirestore.instance;
    Stream<QuerySnapshot> _salleNewCategory = db.collection("categoriesSalles").doc(current_classroom.id_classroom).collection(current_classroom.id_classroom).snapshots();
    return StreamBuilder<QuerySnapshot>(
            stream: _salleNewCategory,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if (snapshot.hasError) {
                return const Text("Quelque chose s'est mal passé");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loading();
              }
              return Container(
                color: kColorComposant,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                      child: ToolsBar.falseAppBar(
                        Text('Retour'),
                        'Parametre de la salle',
                        Text(''),
                        (){
                          Navigator.of(context).pop();
                        },
                        (){},
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: kColorAppBar,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                "Passer de la catégorie "+current_category.name_category!+" à la catégorie ...",
                                style: TextStyle(fontSize: 18,),
                              ),
                              SizedBox(height: 10,),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: snapshot.data?.docs.length,
                                  itemBuilder: (context, index){
                                    final item = CategorySalle.fromSnapshot(snapshot.data?.docs[index]);
                                    return CategoryItem(
                                      title: item.nameCategory!,
                                      description: '',
                                      leading: null,
                                      radio: Radio(
                                        fillColor: MaterialStateProperty.all(Color(0xFF3979d4)),
                                        groupValue: widget.init_category_id,
                                        value: item.id_category,
                                        onChanged: (value){
                                          setState((){
                                            widget.init_category_id = value;
                                            current_salle.category_salle_id = value;
                                          });
                                          Map<String, String> new_value = Map();
                                          new_value = {"category_salle_id": widget.init_category_id};
                                          update.updateSalle(new_value);
                                        },
                                      ),
                                    );
                                  },
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
        );
  }

  // methode de mise à jour de la catégory de la salle
  void updateSalleCategory()
  {
    Map<String, String> new_value = Map();
    new_value = {"category_salle_id":''};
    update.updateSalle(new_value);
  }
}