import 'package:flutter/material.dart';
import 'package:openclass/model/salle.dart';
import '../../../../composants/drawer_header_tools.dart';
import '../../../../constante.dart';

class SalleChatSetting extends StatelessWidget
{
  SalleChatSetting({Key? key, required this.salle}):super(key: key);
  final Salle salle;

  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      backgroundColor: kColorDrawer,
      child: ListView(
        children: <Widget>[
          DrawerHeaderTools(nameClasse: salle.name,),
        ],
      ),
    );
  }
}