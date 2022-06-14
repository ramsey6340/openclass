import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openclass/view/composants/drawer_header_tools.dart';
import 'package:openclass/view/composants/expansion_tile_tools.dart';
import 'package:openclass/view/composants/list_tile_salle.dart';
import 'package:openclass/view/constante.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/add_salle/add_salle_page.dart';
import 'package:openclass/model/enum_category_salle.dart';
import 'package:openclass/model/data.dart';

import '../../model/salle.dart';

class DrawerComponent extends StatefulWidget
{
  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent>
{


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kColorDrawer,
      child: ListView(
        children: <Widget>[
          DrawerHeaderTools(nameClasse: 'GIT'),
          Divider(color: Colors.white,height: 20,),
          ExpansionTileTool(addNavigator: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddSallePage(typeSalle: EnumCategorySalle.information)));}, nameCategory: 'SALLE INFORMATION', salles: [information_general]),
          ExpansionTileTool(addNavigator: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddSallePage(typeSalle: EnumCategorySalle.bibliotheque)));}, nameCategory: 'SALLE BIBLIOTHEQUE', salles: list_salle_biblio),
          ExpansionTileTool(addNavigator: (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddSallePage(typeSalle: EnumCategorySalle.discussion)));}, nameCategory: 'SALLE DISCUSSION', salles: list_salle_discussion),
        ],
      ),
    );
  }
}