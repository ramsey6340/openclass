import 'package:flutter/material.dart';
import 'package:openclass/view/composants/interaction_next_component.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/create_classroom/create_classroom_page.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/join_classroom/join_classroom_page.dart';

class Body extends StatelessWidget
{
  @override
  build(BuildContext context)
  {
    return Column(
      children: <Widget>[
        Text("Crée ta classe", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24 ),textAlign: TextAlign.center,),
        SizedBox(height: 20,),
        Text("Ta classe est l'endroid où tu retrouve tes camarades.\nCrée le tien et commence ton cour.", textAlign: TextAlign.center,),
        SizedBox(height: 20,),
        InteractionComponent(title: "Crée une classe", press: (){Navigator.pushNamed(context, CreateClassroomPage.routeName);}),
        SizedBox(height: 70,),
        Text("Tu as déjà une invitation ?", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),textAlign: TextAlign.center,),
        SizedBox(height: 20,),
        InteractionComponent(title: "Rejoindre une classe", press: (){Navigator.pushNamed(context, JoinClassroomPage.routeName);}),
      ],
    );
  }
}