import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/add_salle/composants/body_biblio.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/add_salle/composants/body_discussion.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/add_salle/composants/body_info.dart';

import '../../../../composants/tools_bar.dart';
import '../../main_screen.dart';
import '../add_friends/add_friends_page.dart';
import 'composants/body_info.dart';
import 'composants/body_biblio.dart';
import 'composants/body_discussion.dart';
import 'package:openclass/model/enum_category_salle.dart';

class AddSallePage extends StatelessWidget
{
  AddSallePage({Key? key, required this.typeSalle}):super(key: key);
  final EnumCategorySalle typeSalle;
  static String routeName = '/add_salle_page';
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Text('Annuler',style: TextStyle(fontSize: 18,)),
          'Créer une salle',
          Text('Créer',style: TextStyle(fontSize: 18,)),
              (){
            Navigator.pop(context);
          },
              (){
            Navigator.pushNamed(context, AddFriendsPage.routeName);
          }
      ),
      body: (typeSalle == EnumCategorySalle.information)?BodyInfo():(typeSalle == EnumCategorySalle.bibliotheque)?BodyBiblio():BodyDiscussion(),
    );
  }
}