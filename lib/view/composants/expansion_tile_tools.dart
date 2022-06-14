import 'package:flutter/material.dart';
import 'package:openclass/view/composants/list_salles.dart';
import 'package:openclass/model/data.dart';
import '../../model/salle.dart';

class ExpansionTileTool extends StatefulWidget
{
  ExpansionTileTool({Key? key, required this.addNavigator, required this.nameCategory, required this.salles}):super(key: key);
  final Function addNavigator;
  final String nameCategory;
  final List<Salle> salles;
  @override
  State<ExpansionTileTool> createState() => _ExpansionTileToolState();
}
class _ExpansionTileToolState extends State<ExpansionTileTool>
{

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      collapsedTextColor: Colors.white,
      iconColor: Colors.white,
      textColor: Colors.white,
      controlAffinity: ListTileControlAffinity.leading,
      childrenPadding: EdgeInsets.only(left: 50),
      trailing: GestureDetector(
        child: Icon(Icons.add),
        onTap: widget.addNavigator as void Function(),
      ),
      title: Text(widget.nameCategory,style: TextStyle(fontSize: 16),),
      children: [ListSalle(salles: widget.salles)],
    );
  }
/*
  static ListTile listTileMethode(String nameSalle, IconData nameIcon)
  {
    return ListTile(
      title: Text(nameSalle,style: TextStyle(fontSize: 15),),
      leading: Icon(nameIcon,color: Colors.white,),
    );
  }

 */
}

