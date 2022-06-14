import 'package:flutter/material.dart';
import 'package:openclass/model/enum_category_salle.dart';
import 'package:openclass/view/screens/interface_user_screens/salle_chat_interface/salle_chat_main_page.dart';
import '../../model/salle.dart';
import 'package:openclass/model/data.dart';


class ListTileSalle extends StatefulWidget
{
  ListTileSalle({Key? key, required this.salle}):super(key: key);
  final Salle salle;
  @override
  State<ListTileSalle> createState() => _ListTileSalleState();
}
class _ListTileSalleState extends State<ListTileSalle>
{

  @override
  Widget build(BuildContext context)
  {
    return ListTile(
      title: Text(widget.salle.name,style: TextStyle(fontSize: 15),),
      leading: Icon(
        Icons.info_outlined,
        //(salle.category.name_category == EnumCategorySalle.information)?Icons.info_outlined:(salle.category.name_category == EnumCategorySalle.bibliotheque)?Icons.menu_book_rounded:Icons.picture_in_picture,
      color: Colors.white,
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SalleChatMainPage(salle: widget.salle)));
      },
    );
  }
}