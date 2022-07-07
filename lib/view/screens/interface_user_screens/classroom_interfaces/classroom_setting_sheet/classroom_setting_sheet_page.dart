import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/create_category/create_category_page.dart';

import '../../../../../model/classroom.dart';
import '../../../../composants/interaction_next_component.dart';
import '../create_salle/create_salle_page.dart';

class ClassroomSettingSheetPage extends StatelessWidget
{
  ClassroomSettingSheetPage({Key ? key, required this.classroom}):super(key: key);
  final Classroom classroom;
  @override
  build(BuildContext context)
  {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: MediaQuery.of(context).size.height*0.8,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(classroom.image),
                  backgroundColor: Colors.transparent,
                  radius: 35,
                ),
                SizedBox(height: 10,),
                Text(classroom.name,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //SizedBox(width: 20,),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 5,
                    ),
                    SizedBox(width: 5,),
                    Text("12 en lignes"),
                  ],
                ),
                SizedBox(width: 20,),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 5,
                    ),
                    SizedBox(width: 5,),
                    Text("32 membres"),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.white,thickness:0.3),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(Icons.person_add, color: Colors.white,),
                    Text("Inviter",style: TextStyle(color: Colors.white),),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.notifications,color: Colors.white,),
                    Text("Notifications", style: TextStyle(color: Colors.white),),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.settings, color: Colors.white,),
                    Text("Paramètres", style: TextStyle(color: Colors.white),),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.white,thickness:0.3),
            SizedBox(height: 50,),
            Column(
              children: [
                InteractionComponent(
                    title: "Créer une catégorie",
                    press: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateCategoryPage(), settings: RouteSettings(arguments: classroom)));
                    }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}