import 'package:flutter/material.dart';

class ExpansionTileTool extends StatelessWidget
{
  ExpansionTileTool({Key? key, required this.addNavigator, required this.nameCategory, required this.classrooms}):super(key: key);
  final Function addNavigator;
  final String nameCategory;
  List<Widget> classrooms = [];
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
        onTap: addNavigator as void Function(),
      ),
      title: Text(nameCategory,style: TextStyle(fontSize: 16),),
      children: classrooms,
    );
  }

  static ListTile listTileMethode(String nameSalle, IconData nameIcon)
  {
    return ListTile(
      title: Text(nameSalle,style: TextStyle(fontSize: 15),),
      leading: Icon(nameIcon,color: Colors.white,),
    );
  }
}