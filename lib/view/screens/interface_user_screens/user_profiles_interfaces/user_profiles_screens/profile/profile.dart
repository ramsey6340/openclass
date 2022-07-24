import 'package:flutter/material.dart';
import 'package:openclass/view/composants/entry_field.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/constante.dart';

import '../../../../../../data/data_user.dart';
import '../../../classroom_setting/composants/photo_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    EntryField entryField = EntryField();
    return Scaffold(
      appBar: ToolsBar.appBar(Text("Retour"), 'Mon profile', Text(""), (){Navigator.of(context).pop();}, (){}),
      body: Container(
        color: kColorComposant,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              SizedBox(height: 20,),
              PhotoProfile(imgProfile: currentUser.imgProfile!, nameUser: '', dateBirth: ''),
              Divider(color: Colors.white,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Prenom et nom:", style: TextStyle(fontSize: 18),),
                  Text(currentUser.firstName!+' '+currentUser.lastName!,style: TextStyle(fontSize: 18),)
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date de naissance:", style: TextStyle(fontSize: 18),),
                  Text(currentUser.dateBirth!,style: TextStyle(fontSize: 18),)
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email:", style: TextStyle(fontSize: 18),),
                  Text(currentUser.email!,style: TextStyle(fontSize: 18),)
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Numero de téléphone:", style: TextStyle(fontSize: 18),),
                  Text(currentUser.telNumber!,style: TextStyle(fontSize: 18),)
                ],
              ),
              SizedBox(height: 10,),
              Text("Description: ", style: TextStyle(fontSize: 18),),
              Divider(color: Colors.white,),
              SizedBox(height: 50,),
              Text("Modifier ma description", style: TextStyle(fontSize: 18),),
              entryField.buildMultiTextField(),
            ],
          ),
        ),
      ),
    );
  }
}
