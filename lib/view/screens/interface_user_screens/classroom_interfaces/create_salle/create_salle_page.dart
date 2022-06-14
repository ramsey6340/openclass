import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/add_friends/add_friends_page.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import 'composants/body.dart';
import '../../../../composants/tools_bar.dart';

class CreateSallePage extends StatelessWidget
{
  static String routeName = '/create_salle_page';
  static bool privateSalle = false;
  @override
  build(BuildContext context)
  {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Text('Annuler',style: TextStyle(fontSize: 18,)),
          'Créer une salle',
          (privateSalle == false)?Text('Créer',style: TextStyle(fontSize: 18,)):Text('Suivant',style: TextStyle(fontSize: 18,)),
          (){
            Navigator.pushNamed(context, MainScreen.routeName);
          },
          (){
            Navigator.pushNamed(context, AddFriendsPage.routeName);
          }
      ),
      body: Body(),
    );
  }


}
