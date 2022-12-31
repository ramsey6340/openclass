import 'package:flutter/material.dart';
import '../../data/data_current.dart';
import '../../model/adhesion.dart';
import '../../model/classroom.dart';
import '../constante.dart';
import '../screens/interface_user_screens/classroom_interfaces/classroom_setting_sheet/classroom_setting_sheet_page.dart';
import 'invite_button.dart';

/// Widget qui contient les element qui doivent être mis dans le header du drawer de l'interface des classe
/// Ces element peuvent être le nom de la classe, un boutton pour inviter d'autre personne, etc

class DrawerHeaderTools extends StatelessWidget
{
  const DrawerHeaderTools({Key? key, required this.nameClasse, required this.classroom}):super(key: key);
  final String? nameClasse;
  final Classroom classroom;
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(nameClasse!,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
              GestureDetector(
                child: const Icon(Icons.more_horiz,color: Colors.white,),
                onTap: (){
                  _showClassroomSettingSheet(context, classroom);
                },
              ),
            ],
          ),
          const SizedBox(height: 50,),
          InviteButton(),
        ],
      ),
    );
  }

  // la methode qui sera appelé lorsqu'on clique sur le boutton réglage d'une classe
  void _showClassroomSettingSheet(BuildContext context, Classroom classroom)
  {
    Navigator.pop(context);
    showModalBottomSheet(
      backgroundColor: kColorBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context){
          return ClassroomSettingSheetPage(classroom: classroom);
        }
    );
  }

  // methode pour determiner le nombre de membre de la classe
  int nbOfMembers(List<Adhesion> list_adhesion)
  {
    int nbre = 0;
    for(int i=0; i<list_adhesion.length; i++){
      if(current_classroom.idClassroom == list_adhesion[i].classroomId){
        nbre++;
      }
    }
    return nbre;
  }
}