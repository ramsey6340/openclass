import 'package:flutter/material.dart';
import 'package:openclass/model/salle.dart';
import 'package:openclass/view/composants/tools_bar.dart';

class SalleChatMainPage extends StatelessWidget
{
  SalleChatMainPage({Key? key, required this.salle,}):super(key: key);
  final Salle salle;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: ToolsBar.appBar(
          Icon(Icons.navigate_before,color: Colors.white, size: 30,),
          salle.name,
          Icon(Icons.more_horiz, color: Colors.white,),
          (){
            Navigator.pop(context);
          },
          (){}
      ),
      body: Container(),
    );
  }


}