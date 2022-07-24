import 'package:flutter/material.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import 'composants/body.dart';

class AddFriendsPage extends StatelessWidget
{
  static String routeName = '/add_friends_page';
  @override
  build(BuildContext context)
  {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Icon(Icons.navigate_before),
          'Ajouter des camarades',
          Text("Finir", style: TextStyle(fontSize: 16),),
          (){
            Navigator.pop(context);
          },
          (){
            // traitement lorsqu'on clique sur "Finir"
            Navigator.pushNamed(context, MainScreen.routeName);
          }
      ),
      body: Body(),
    );
  }
}