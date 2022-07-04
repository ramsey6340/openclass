import 'package:flutter/material.dart';
import 'package:openclass/data/data_user.dart';
import 'package:openclass/model/category_salle.dart';
import 'package:openclass/view/composants/external_link.dart';
import 'package:openclass/view/composants/next_button.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import '../../../../../../data/data_category_salle.dart';
import '../../../../../../data/data_classroom.dart';
import '../../../../../../data/data_responsible.dart';
import '../../../../../../data/data_salle.dart';
import '../../../../../../increment.dart';
import '../../../../../../model/classroom.dart';
import '../../../../../../model/enum_type.dart';
import '../../../../../../model/salle.dart';
import 'choose_picture_class.dart';
import '../../../../../composants/entry_field.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  Classroom classroom_create = Classroom.empty();
  final entryField = EntryField();
  bool _privateClassroom = false;
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
                press: (){
                  // creation de l'instance de la nouvelle classe
                  String name = entryField.textController.text;
                  String description = entryField.multiTextController.text;
                  classroom_create = Classroom(Increment.idClassroom, name, 'assets/images/img_default_class.png', '12/12/2020', description, _privateClassroom, data_list_responsible[0]);

                  // ajout du nouvelle classe
                  data_list_classrooms.add(classroom_create);

                  // creation des trois categories de base
                  List<CategorySalle> list_category = creationOfTheeBaseCategories(classroom_create);

                  // creation de la salle de base pour chaque catégorie
                  creationOfBaseSalle(list_category);

                  // redirection vers la liste des classes
                  Navigator.pushNamed(context, MainScreen.routeName);
                  /*
                  return showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Données de la classe"),
                          content: Column(
                            children: [
                              Text("La classe", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              Text('${data_list_classrooms[Increment.id_classroom-1].id}',style: TextStyle(fontSize: 16)),
                              Text(data_list_classrooms[Increment.id_classroom-1].name,style: TextStyle(fontSize: 16)),
                              Text(data_list_classrooms[Increment.id_classroom-1].description,style: TextStyle(fontSize: 16)),
                              Text('${data_list_classrooms[Increment.id_classroom-1].isPrivate}',style: TextStyle(fontSize: 16)),
                              Text('${data_list_classrooms[Increment.id_classroom-1].responsible.firstName}',style: TextStyle(fontSize: 16)),
                              Text("Les categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              Text('${data_List_categories_salle[Increment.id_category-3].id}'+' ${data_List_categories_salle[Increment.id_category-3].name}'+' ${data_List_categories_salle[Increment.id_category-3].description}'+' ${data_List_categories_salle[Increment.id_category-3].type}'+' ${data_List_categories_salle[Increment.id_category-3].creationDate}'+' ${data_List_categories_salle[Increment.id_category-3].classroom.name}',style: TextStyle(fontSize: 16)),
                              Text('${data_List_categories_salle[Increment.id_category-2].id}'+' ${data_List_categories_salle[Increment.id_category-2].name}'+' ${data_List_categories_salle[Increment.id_category-2].description}'+' ${data_List_categories_salle[Increment.id_category-2].type}'+' ${data_List_categories_salle[Increment.id_category-2].creationDate}'+' ${data_List_categories_salle[Increment.id_category-2].classroom.name}',style: TextStyle(fontSize: 16)),
                              Text('${data_List_categories_salle[Increment.id_category-1].id}'+' ${data_List_categories_salle[Increment.id_category-1].name}'+' ${data_List_categories_salle[Increment.id_category-1].description}'+' ${data_List_categories_salle[Increment.id_category-1].type}'+' ${data_List_categories_salle[Increment.id_category-1].creationDate}'+' ${data_List_categories_salle[Increment.id_category-1].classroom.name}',style: TextStyle(fontSize: 16)),
                              Text("Les salles", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              Text('${data_list_salles[Increment.id_salle-3].id}'+' ${data_list_salles[Increment.id_salle-3].name}'+' ${data_list_salles[Increment.id_salle-3].categorySalle.name}',style: TextStyle(fontSize: 16)),
                              Text('${data_list_salles[Increment.id_salle-2].id}'+' ${data_list_salles[Increment.id_salle-2].name}'+' ${data_list_salles[Increment.id_salle-2].categorySalle.name}',style: TextStyle(fontSize: 16)),
                              Text('${data_list_salles[Increment.id_salle-1].id}'+' ${data_list_salles[Increment.id_salle-1].name}'+' ${data_list_salles[Increment.id_salle-1].categorySalle.name}',style: TextStyle(fontSize: 16)),

                            ],
                          ),
                          actions: [
                            TextButton(onPressed: (){Navigator.pushNamed(context, MainScreen.routeName);}, child: Text("OK"))
                          ],
                        );
                      }
                  );
                  */
                }
            ),
          ),
        ],
      ),
    );
  }

  // methode de creation des trois categories de base
  List<CategorySalle> creationOfTheeBaseCategories(Classroom classroom)
  {
    List<CategorySalle> list_category = [];
    CategorySalle categorySalle = CategorySalle.empty();
    List<String> name_category = ['SALLES INFORMATION', 'SALLES BIBLIOTHEQUE', 'SALLES DISCUSSION'];
    List<String> description_category = ['Salle de catégorie information', 'Salle de catégorie document', 'Salle de catégorie discussion'];
    List<EnumCategorySalle> type_category = [EnumCategorySalle.information, EnumCategorySalle.bibliotheque, EnumCategorySalle.discussion];

    for(int i=0; i<3; i++){
      categorySalle = CategorySalle(Increment.idCategory, name_category[i], '02/02/2022', description_category[i], type_category[i], classroom);
      data_List_categories_salle.add(categorySalle);
      list_category.add(categorySalle);
    }
    return list_category;
  }

  // methode de creation de la salle de base pour chacun des trois categories de base
  void creationOfBaseSalle(List<CategorySalle> list_category)
  {
    Salle salle = Salle.empty();
    for(int i=0; i<3; i++){
      salle = Salle(Increment.idSalle, 'géneral', '12/02/2019', false, list_category[i]);
      data_list_salles.add(salle);
    }
  }

}