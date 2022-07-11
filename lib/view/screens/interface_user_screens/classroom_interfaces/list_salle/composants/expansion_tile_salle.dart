import 'package:flutter/material.dart';
import 'package:openclass/data/data_current_classroom.dart';
import 'package:openclass/model/enum_type.dart';
import 'package:openclass/view/screens/interface_user_screens/salle_chat_interface/salle_chat_main_page.dart';
import 'package:openclass/view/screens/interface_user_screens/salle_setting/salle_setting_page.dart';

import '../../../../../../model/salle.dart';

class ExpansionTileSalle extends StatefulWidget {
  ExpansionTileSalle({Key? key, required this.addNavigator, required this.nameCategory, required this.sallesInit, required this.index}):super(key: key);
  final Function addNavigator;
  final String nameCategory;
  final List<Salle> sallesInit;
  final int index;
  @override
  State<ExpansionTileSalle> createState() => _ExpansionTileSalleState();

}
class _ExpansionTileSalleState extends State<ExpansionTileSalle>{
  List<Widget> list_salles = [];
  @override
  initState(){
    super.initState();
    listTileMethode();
  }
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Colors.white,
      collapsedTextColor: Colors.white,
      iconColor: Colors.white,
      textColor: Colors.white,
      controlAffinity: ListTileControlAffinity.leading,
      childrenPadding: EdgeInsets.only(left: 50),
      leading: null,
      trailing: TextButton(
        child: Text("Modifier"),
        onPressed: widget.addNavigator as void Function(),
      ),
      title: Text(widget.nameCategory.toString().split('.').last.toUpperCase(),style: TextStyle(fontSize: 16),),
      initiallyExpanded: true,
      children: list_salles,
    );
  }
  // creation de la liste de salle
  void listTileMethode()
  {
    final iconInfo = Icon(Icons.info_outlined,);
    final iconBiblio = Icon(Icons.import_contacts);
    final iconDiscussion = Icon(Icons.screenshot_monitor);
    for(int i=0; i<widget.sallesInit.length; i++){
      final temp = ListTile(
        iconColor: Colors.white,
        textColor: Colors.white,
        horizontalTitleGap: 0,
        title: Text(widget.sallesInit[i].name,style: TextStyle(fontSize: 16,),),
        leading: (widget.sallesInit[i].categorySalle.type == EnumCategorySalle.information)?iconInfo:(widget.sallesInit[i].categorySalle.type == EnumCategorySalle.bibliotheque)?iconBiblio:iconDiscussion,
        onTap: (){
          data_current_salle = widget.sallesInit[i];
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SalleSettingPage(),
              )
          );
        },
      );
      list_salles.add(temp);
    }
  }

}

