import 'dart:io';
import 'package:flutter/material.dart';
import 'package:openclass/data/data_user.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/classroom_screen/list_classroom_page.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/list_salle/list_salle_page.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import 'package:openclass/view/screens/interface_user_screens/user_profiles_interfaces/user_profiles_screens/composants/photo_profile.dart';
import 'package:openclass/view/composants/interaction_next_component.dart';

import '../../../../../data/data_current_classroom.dart';
import '../../classroom_interfaces/list_members/list_members_page.dart';
class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  @override
  build(BuildContext context)
  {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ToolsBar.falseAppBar(
                Text("Fermer"),
                'Paramètre de la classe',
                Text(""),
                (){
                  //Navigator.pushNamed(context, MainScreen.routeName);
                  Navigator.of(context).pop();
                },
                (){}
            ),
            SizedBox(height: 50,),
            Expanded(
                child: ListView(
                  children: [
                    PhotoProfile(imgProfile: data_current_classroom.imgProfile, nameUser: data_current_classroom.nameClassroom, dateBirth: data_current_classroom.creationDate),
                    SizedBox(height: 50,),
                    Text("PARAMETRES"),
                    InteractionComponent(
                        title: "Salles",
                        press: (){
                          Navigator.pushNamed(context, ListSallePage.routeName);
                        }
                        ),
                    Divider(color: Colors.white,height: 0,thickness:0.5),
                    InteractionComponent(title: "Membres", press: (){Navigator.pushNamed(context, ListMembersPage.routeName);}),
                    Divider(color: Colors.white,height: 0,thickness:0.5),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}