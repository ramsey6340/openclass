import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/user_profiles_interfaces/user_profiles_screens/composants/photo_profile.dart';
import '../../../../../constante.dart';
import 'package:openclass/view/composants/interaction_next_component.dart';
class Body extends StatefulWidget
{
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  late File _imageFile;
  late dynamic _pickImageError;
  List<Widget> listSettingUser = [
    InteractionComponent(title: "Compte", routeName: ''),
    InteractionComponent(title: "Profile d'utilisateur", routeName: ''),
  ];
  List<Widget> listSettingAppli = [
    InteractionComponent(title: 'Langue', routeName: ''),
    InteractionComponent(title: 'Notification', routeName: ''),
  ];

  @override
  build(BuildContext context)
  {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              PhotoProfile(imgProfile: 'assets/images/informatique.jpg', nameUser: 'Drissa Sidiki Traore', dateBirth: '13/09/2020'),
              SizedBox(height: 50,),
              Text("PARAMETRE DE L'UTILISATEUR"),
              InteractionComponent(title: "Compte", routeName: ''),
              Divider(color: Colors.white,height: 0,thickness:0.5),
              InteractionComponent(title: "Profile d'utilisateur", routeName: ''),
              SizedBox(height: 30,),
              Text("PARAMETRE DE L'APPLI"),
              InteractionComponent(title: "Langue", routeName: ''),
              Divider(color: Colors.white,height: 0,thickness:0.5),
              InteractionComponent(title: "Notification", routeName: ''),
            ],
          ),
        ),
    );
  }
}