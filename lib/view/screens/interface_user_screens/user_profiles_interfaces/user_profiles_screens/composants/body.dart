import 'dart:io';
import 'package:flutter/material.dart';
import 'package:openclass/data/data_user.dart';
import 'package:openclass/view/screens/interface_user_screens/user_profiles_interfaces/user_profiles_screens/composants/photo_profile.dart';
import 'package:openclass/view/composants/interaction_next_component.dart';
class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  List<Widget> listSettingUser = [
    InteractionComponent(title: "Compte", press: (){}),
    InteractionComponent(title: "Profile d'utilisateur", press: (){}),
  ];
  List<Widget> listSettingAppli = [
    InteractionComponent(title: 'Langue', press: (){}),
    InteractionComponent(title: 'Notification', press: (){}),
  ];

  @override
  build(BuildContext context)
  {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              PhotoProfile(imgProfile: currentUser.imgProfile, nameUser: currentUser.firstName+' '+currentUser.lastName, dateBirth: currentUser.dateBirth),
              SizedBox(height: 50,),
              Text("PARAMETRE DE L'UTILISATEUR"),
              InteractionComponent(title: "Compte", press: (){}),
              Divider(color: Colors.white,height: 0,thickness:0.5),
              InteractionComponent(title: "Profile d'utilisateur", press: (){}),
              SizedBox(height: 30,),
              Text("PARAMETRE DE L'APPLI"),
              InteractionComponent(title: "Langue", press: (){}),
              Divider(color: Colors.white,height: 0,thickness:0.5),
              InteractionComponent(title: "Notification", press: (){}),
            ],
          ),
        ),
    );
  }
}