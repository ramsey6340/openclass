import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openclass/model/classroom.dart';
import 'package:openclass/view/composants/drawer_header_tools.dart';
import 'package:openclass/view/composants/expansion_tile_tools.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/add_salle/add_salle_page.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/classroom_screen/list_classroom_page.dart';
import '../../controller/classroom_ctrl.dart';
import '../../model/category_salle.dart';
import '../../model/salle.dart';
import '../screens/interface_user_screens/main_screen.dart';

class DrawerComponent extends StatefulWidget
{
  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}
class _DrawerComponentState extends State<DrawerComponent>
{
  final ClassroomCtrl classroomTest = ClassroomCtrl();
  @override
  Widget build(BuildContext context) {
    final classroom = ModalRoute.of(context)!.settings.arguments as Classroom;
    classroomTest.modifClassroom(classroom);
    //final list_categories = chooseCategorySalle(classroom.id, List_complet_categories_salle);
    return Drawer(
      backgroundColor: kColorDrawer,
      child: StreamBuilder<Classroom>(
        stream: classroomTest.stream,
        initialData: Classroom.empty(),
        builder: (context, snapshot){
          return Column(
            children: <Widget>[
              DrawerHeaderTools(nameClasse: snapshot.data!.name),
              Divider(color: Colors.white,height: 20,),
              Expanded(
                child: Column(
                  children: [
                    Text('${snapshot.data!.name}'),
                    TextButton(
                        onPressed: (){
                          classroomTest.modifName("GEEA");
                          //Navigator.pushNamed(context, MainScreen.routeName);
                        },
                        child: Text("Modifier")
                    )
                  ],
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
    classroomTest.dispose();
    super.dispose();
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
  /*
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

   */
}