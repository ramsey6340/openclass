import 'package:flutter/material.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/screens/interface_user_screens/category_setting/category_setting_page.dart';

import '../../../../../../data/data_category_salle.dart';
import '../../../../../../data/data_classroom.dart';
import '../../../../../../data/data_salle.dart';
import '../../../../../../increment.dart';
import '../../../../../../model/category_salle.dart';
import '../../../../../../model/salle.dart';
import '../../../../../constante.dart';
import 'expansion_tile_salle.dart';

class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  @override
  Widget build(BuildContext context)
  {
    final classroomValue = data_list_classrooms[Increment.id_current_classroom-1];
    final list_categories = chooseCategorySalle(classroomValue.id, data_List_categories_salle);

    return SafeArea(
      child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ToolsBar.falseAppBar(
                  Text("Retour"),
                  'Salles',
                  Text(''),
                      (){
                    Navigator.of(context).pop();
                  },
                      (){}
              ),
            ),
              Expanded(
                child: Container(
                  color: kColorAppBar,
                  child: ListView.builder(
                    itemCount: list_categories.length,
                    itemBuilder: (context, index){
                      return ExpansionTileSalle(addNavigator: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CategorySettingPage(), settings: RouteSettings(arguments: list_categories[index])));}, nameCategory: list_categories[index].name, sallesInit: chooseSalle(list_categories[index].id, data_list_salles), index: index,);
                    },
                  ),
                ),
              ),
          ],
        ),
    );
  }


  //methode pour choisir les salles correspondant à chaque categorie
  static List<Salle> chooseSalle(int id_category, List<Salle> list_salles)
  {
    List<Salle> salles =[];
    for(int i=0; i<list_salles.length; i++){
      if(list_salles[i].categorySalle.id == id_category){
        salles.add(list_salles[i]);
      }
    }
    return salles;
  }

  //methode pour choisir les categories correspondant à chaque classe
  static List<CategorySalle> chooseCategorySalle(int id_classroom, List<CategorySalle> list_categories)
  {
    List<CategorySalle> categories = [];
    for(int i=0; i<list_categories.length; i++){
      if(list_categories[i].classroom.id == id_classroom){
        categories.add(list_categories[i]);
      }
    }
    return categories;
  }

}