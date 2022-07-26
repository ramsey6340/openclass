import 'package:flutter/material.dart';
import 'package:openclass/data/data_current_classroom.dart';
import '../../model/salle.dart';
import '../screens/interface_user_screens/chat_interface/chat_salle/chat_page_salle.dart';

class ListTileSalle extends StatelessWidget
{
  ListTileSalle({Key? key, required this.salleInit, required this.leading}):super(key: key);
  final Salle salleInit;
  final Widget leading;
  @override
  Widget build(BuildContext context)
  {
    return ListTile(
      iconColor: Colors.white,
      textColor: Colors.white,
      horizontalTitleGap: 0,
      title: Text(salleInit.nameSalle!,style: TextStyle(fontSize: 16,),),
      leading: leading,
      onTap: (){
        data_current_salle = salleInit;
        //data_current_category = data_current_salle.categorySalle;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPageSalle(),
            )
        );
      },
    );
  }
}