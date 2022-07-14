import 'package:flutter/material.dart';
import 'package:openclass/data/data_current_classroom.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/screens/interface_user_screens/category_setting/category_setting_page.dart';
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
    /*
    final classroomValue = data_list_classrooms[Increment.id_current_classroom-1];
    final list_categories = chooseCategorySalle(classroomValue.id, data_List_categories_salle);

     */

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
                    itemCount: data_current_list_categories_salle.length,
                    itemBuilder: (context, index){
                      return ExpansionTileSalle(addNavigator: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CategorySettingPage(), settings: RouteSettings(arguments: data_current_list_categories_salle[index])));}, nameCategory: data_current_list_categories_salle[index].name, sallesInit: chooseSalle(data_current_list_categories_salle[index].id, data_current_list_salle), index: index,);
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

}