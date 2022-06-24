import 'package:flutter/material.dart';
import 'package:openclass/view/screens/interface_user_screens/salle_chat_interface/salle_chat_main_page.dart';
import 'package:provider/provider.dart';
import '../../model/salle.dart';

class ListTileSalle extends StatelessWidget
{
  ListTileSalle({Key? key, required this.salleInit}):super(key: key);
  final Salle salleInit;
  @override
  Widget build(BuildContext context)
  {
    /*final Salle salle = Provider.of<Salle>(context);
    salle.name = salleInit.name;
    salle.id = salleInit.id;

     */
    return ListTile(
      title: Text(salleInit.name,style: TextStyle(fontSize: 15),),
      leading: Icon(
        Icons.info_outlined,
        //(salle.category.name_category == EnumCategorySalle.information)?Icons.info_outlined:(salle.category.name_category == EnumCategorySalle.bibliotheque)?Icons.menu_book_rounded:Icons.picture_in_picture,
      color: Colors.white,
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SalleChatMainPage(salle: salleInit)));
      },
    );
  }
}