import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import 'composants/body.dart';
import '../../../../composants/tools_bar.dart';

class CreateCategoryPage extends StatelessWidget
{
  static String routeName = '/create_category_page';
  @override
  build(BuildContext context)
  {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Text('Annuler',style: TextStyle(fontSize: 18,)),
          'Créer une categorie',
          Text('Créer',style: TextStyle(fontSize: 18,)),
              (){
            Navigator.pushNamed(context, MainScreen.routeName);
          },
              (){}
      ),
      body: Body(),
    );
  }
}