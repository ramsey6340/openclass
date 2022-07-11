import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/create_category/create_category_page.dart';

import '../../../../../data/data_current_classroom.dart';
import '../../../../../model/classroom.dart';
import '../../../../composants/interaction_next_component.dart';
import '../../../../constante.dart';
import '../../classroom_setting/setting_page.dart';
import '../classsroom_invitation_sheet/classroom_invitation_sheet_page.dart';
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
                    Text('${data_current_number_of_member} membres'),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.white,thickness:0.3),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.person_add, color: Colors.white,),
                      Text("Inviter",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  onTap: (){
                    _showClassroomSettingSheet(context);
                  },
                ),
                GestureDetector(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.notifications,color: Colors.white,),
                      Text("Notifications", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  onTap: (){},
                ),
                GestureDetector(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.settings, color: Colors.white,),
                      Text("Paramètres", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, SettingPage.routeName);
                  },
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
                      //Navigator.pop(context);
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


  void _showClassroomSettingSheet(BuildContext context)
  {
    Navigator.pop(context);
    showModalBottomSheet(
        backgroundColor: kColorBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context){
          return ClassroomInvitationSheetPage();
        }
    );
  }
}