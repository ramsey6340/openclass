import 'package:flutter/material.dart';
import '../../model/salle.dart';
import '../screens/interface_user_screens/chat_interface/chat_salle/chat_page_salle.dart';

/// Widget qui permet de crée le ListTile d'une salle avec un moyen de naviguer vers la salle

class ListTileSalle extends StatefulWidget
{
  const ListTileSalle({Key? key, required this.salleInit, required this.leading}):super(key: key);
  final Salle salleInit;
  final Widget leading;
  @override
  State<ListTileSalle> createState() => _ListTileSalleState();
}

class _ListTileSalleState extends State<ListTileSalle>
{

  @override
  Widget build(BuildContext context)
  {
    return ListTile(
      iconColor: Colors.white,
      textColor: Colors.white,
      horizontalTitleGap: 0,
      title: Text(widget.salleInit.nameSalle!,style: const TextStyle(fontSize: 16,),),
      leading: widget.leading,
      onTap: (){
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