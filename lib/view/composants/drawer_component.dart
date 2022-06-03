import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openclass/view/composants/drawer_header_tools.dart';
import 'package:openclass/view/composants/expansion_tile_tools.dart';
import 'package:openclass/view/constante.dart';

class DrawerComponent extends StatefulWidget
{
  DrawerComponent({Key? key}):super(key: key);
  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent>
{
  List<Widget> classrooms_information= [
    ExpansionTileTool.listTileMethode('annoce générale', Icons.info_outline_rounded),
    ExpansionTileTool.listTileMethode('annonce informatique', Icons.info_outline_rounded),
    ExpansionTileTool.listTileMethode('annoce télécom', Icons.info_outline_rounded),
  ];

  List<Widget> classrooms_document= [
    ExpansionTileTool.listTileMethode('annoce générale', Icons.menu_book_rounded),
    ExpansionTileTool.listTileMethode('annonce informatique', Icons.menu_book_rounded),
    ExpansionTileTool.listTileMethode('annoce télécom', Icons.menu_book_rounded),
  ];

  List<Widget> classrooms_discussion= [
    ExpansionTileTool.listTileMethode('annoce générale', Icons.screen_lock_landscape),
    ExpansionTileTool.listTileMethode('annonce informatique', Icons.screen_lock_landscape),
    ExpansionTileTool.listTileMethode('annoce télécom', Icons.screen_lock_landscape),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kColorDrawer,
      child: ListView(
        children: <Widget>[
          DrawerHeaderTools(nameClasse: 'GIT-L3-S6',),
          Divider(color: Colors.white,height: 20,),
          ExpansionTileTool(addNavigator: (){}, nameCategory: 'SALLE INFORMATION', classrooms: classrooms_information),
          ExpansionTileTool(addNavigator: (){}, nameCategory: 'SALLE BIBLIOTHEQUE', classrooms: classrooms_document),
          ExpansionTileTool(addNavigator: (){}, nameCategory: 'SALLE DISCUSSION', classrooms: classrooms_discussion),
        ],
      ),
    );
  }
}