import 'package:flutter/material.dart';
import 'package:openclass/view/constante.dart';
import '../../main_screen.dart';
import 'composants/body.dart';
class ChooseCreateClassroomPage extends StatelessWidget
{
  static String routeName = '/choose_create_classroom_page';
  @override
  build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: kColorDrawer,
      appBar: AppBar(
        backgroundColor: kColorDrawer,
        leadingWidth: 70,
        leading: GestureDetector(
          child: Text("Annuler",style: TextStyle(fontSize: 18),),
          onTap: (){
            Navigator.pushNamed(context, MainScreen.routeName);
          },
        ),
      ),
      body: Body(),
    );
  }
}