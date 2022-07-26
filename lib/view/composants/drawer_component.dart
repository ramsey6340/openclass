import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openclass/data/data_classroom.dart';
import 'package:openclass/increment.dart';
import 'package:openclass/model/classroom.dart';
import 'package:openclass/view/composants/drawer_header_tools.dart';
import 'package:openclass/view/composants/expansion_tile_tools.dart';
import 'package:openclass/view/constante.dart';
import '../../controller/classroom_ctrl.dart';
import '../../data/data_current_classroom.dart';
import '../../model/category_salle.dart';
import '../../model/salle.dart';
import '../../data/data_category_salle.dart';
import '../../data/data_salle.dart';
import '../screens/interface_user_screens/classroom_interfaces/create_salle/create_salle_page.dart';

class DrawerComponent extends StatefulWidget
{
  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}
class _DrawerComponentState extends State<DrawerComponent>
{
  final ClassroomCtrl classroom = ClassroomCtrl();

  @override
  Widget build(BuildContext context) {
    //final classroomValue = ModalRoute.of(context)!.settings.arguments as Classroom;
    //final classroomValue = data_list_classrooms[Increment.id_current_classroom-1];
    //data_current_classroom = data_list_classrooms[Increment.id_current_classroom];
    //classroom.modifClassroom(classroomValue);
    classroom.modifClassroom(data_current_classroom);
    //final list_categories = chooseCategorySalle(classroomValue.id, data_List_categories_salle);
    data_current_list_categories_salle = chooseCategoriesSalle(data_current_classroom.idClassroom, data_List_categories_salle);
    data_current_list_salle = chooseCurrentSalles(data_current_list_categories_salle, data_list_salles);

    return Drawer(
      backgroundColor: kColorDrawer,
      width: MediaQuery.of(context).size.width * 0.82,
      child: StreamBuilder<Classroom>(
        stream: classroom.stream,
        initialData: Classroom(),
        builder: (context, snapshot){
          return Column(
            children: <Widget>[
              DrawerHeaderTools(nameClasse: snapshot.data!.name_classroom!, classroom: data_current_classroom,),
              Divider(color: Colors.white,height: 20,),
              Expanded(
                child: ListView.builder(
                  itemCount: data_current_list_categories_salle.length,
                  itemBuilder: (context, index){
                    return ExpansionTileTool(addNavigator: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CreateSallePage(), settings: RouteSettings(arguments: data_current_list_categories_salle[index])));}, nameCategory: data_current_list_categories_salle[index].nameCategory, sallesInit: chooseSalles(data_current_list_categories_salle[index].idCategory, data_current_list_salle), index: index,);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  @override
  void dispose(){
    classroom.dispose();
    super.dispose();
  }

  //methode pour choisir les salles correspondant à chaque categorie
  static List<Salle> chooseSalles(String? id_category, List<Salle> list_salles)
  {
    List<Salle> salles =[];
    for(int i=0; i<list_salles.length; i++){
      if(list_salles[i].categorySalleId == id_category){
        salles.add(list_salles[i]);
      }
    }
    return salles;
  }


  //methode pour choisir les salles correspondant à chaque categorie
  static List<Salle> chooseCurrentSalles(List<CategorySalle> list_categories, List<Salle> list_salles)
  {
    List<Salle> salles =[];
    for(int i=0; i<list_categories.length; i++){
      for(int j=0; j<list_salles.length; j++){
        if(list_salles[j].categorySalleId == list_categories[i].idCategory){
          salles.add(list_salles[j]);
        }
      }
    }
    return salles;
  }



  //methode pour choisir les categories correspondant à chaque classe
  static List<CategorySalle> chooseCategoriesSalle(String? id_classroom, List<CategorySalle> list_categories)
  {
    List<CategorySalle> categories = [];
    for(int i=0; i<list_categories.length; i++){
      if(list_categories[i].classroomId == id_classroom){
        categories.add(list_categories[i]);
      }
    }
    return categories;
  }

}