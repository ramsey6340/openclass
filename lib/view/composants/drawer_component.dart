import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openclass/model/classroom.dart';
import 'package:openclass/view/composants/drawer_header_tools.dart';
import 'package:openclass/view/composants/expansion_tile_tools.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/add_salle/add_salle_page.dart';

import '../../model/data.dart';

class DrawerComponent extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    final classroom = ModalRoute.of(context)!.settings.arguments as Classroom;
    //final ListOfSalle salles = Provider.of<ListOfSalle>(context);
    return Drawer(
      backgroundColor: kColorDrawer,
      child: Column(
        children: <Widget>[
          DrawerHeaderTools(nameClasse: classroom.name),
          Divider(color: Colors.white,height: 20,),
          Expanded(
              child: ListView.builder(
                itemCount: list_categories_salle.length,
                  itemBuilder: (context, index){
                    return ExpansionTileTool(addNavigator: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddSallePage(typeSalle: list_categories_salle[index].type)));}, nameCategory: list_categories_salle[index].name, sallesInit: list_salle_info);
                  },
              ),
          ),
        ],
      ),
    );
  }
}