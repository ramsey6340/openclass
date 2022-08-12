import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/create_category/create_category_page.dart';
import 'package:openclass/view/screens/interface_user_screens/main_screen.dart';
import '../../../../../CRUD/delete.dart';
import '../../../../../data/data_current.dart';
import '../../../../../model/classroom.dart';
import '../../../../composants/confirmation_alert_dialogue.dart';
import '../../../../composants/interaction_next_component.dart';
import '../../../../constante.dart';
import '../../classroom_setting/setting_page.dart';
import '../classsroom_invitation_sheet/classroom_invitation_sheet_page.dart';

class ClassroomSettingSheetPage extends StatelessWidget
{
  ClassroomSettingSheetPage({Key ? key, required this.classroom}):super(key: key);
  final Classroom classroom;
  @override
  build(BuildContext context)
  {
    Delete delete = Delete();
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
                  backgroundImage: AssetImage(classroom.imgProfile),
                  backgroundColor: Colors.transparent,
                  radius: 35,
                ),
                SizedBox(height: 10,),
                Text(classroom.nameClassroom,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
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
                    Text("0 en lignes"),
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
                    Text('${classroom.membres?.length} membres'),
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
                (current_classroom.responsible_id == current_user.id)?InteractionComponent(
                    title: "Créer une catégorie",
                    press: (){
                      //Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateCategoryPage(), settings: RouteSettings(arguments: classroom)));
                    }
                ):Container(),
              ],
            ),
            SizedBox(height: 50,),
            InkWell(
              child: Container(
                  height: 50,
                  color: kColorSearch,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Supprimer la classe", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center,),
                    ],
                  )
              ),
              onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ConfirmationAlertDialog(
                      title: 'Supprimer la classe',
                      message: 'Toutes les catégories seront aussi supprimer',
                      action: 'Supprimer',
                      press: () {
                        delete.deleteClasse(current_classroom.id_classroom);
                        current_menu_index = 0;
                        Navigator.pushNamed(context, MainScreen.routeName);
                        current_classroom = Classroom('','','','');
                      },
                    );
                  }
              ),
            )
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