import 'package:flutter/material.dart';
import 'package:openclass/view/composants/tools_bar.dart';
import 'package:openclass/view/screens/interface_user_screens/classroom_interfaces/add_friends/composants/contact.dart';
import '../../../../../../data/data_current.dart';
import '../../../../../../model/adhesion.dart';
import '../../../../../../model/user.dart';
import '../../../../../composants/search_bar.dart';

class Body extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    final members = [];

    return Container(
      //color: kColorAppBar,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: ToolsBar.falseAppBar(
                Text('Retour'),
                'Membres',
                Text(''),
                (){
                  Navigator.of(context).pop();
                },
                (){}
            ),
          ),
          SearchBar(listSearch: []),
          Expanded(
            child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index){
                  final item = members[index];
                  return Contact(
                      imgContact: item.imgProfile!,
                      nameContact: item.firstName!+' '+item.lastName!,
                      action: IconButton(
                        icon: Icon(Icons.navigate_next, color: Colors.white,),
                        onPressed: (){},
                      ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }

  // methode pour selectionner les membres de la classe courente
  List<UserModel> chooseMembers(List<Adhesion> list_adhesion)
  {
    List<UserModel> list_members = [];
    for(int i=0; i<list_adhesion.length; i++){
      if(current_classroom.idClassroom == list_adhesion[i].classroom_id){
        //list_members.add(list_adhesion[i].user);
      }
    }
    return list_members;
  }
}