import 'package:flutter/material.dart';

import '../constante.dart';

class ToolsBar
{
  //static PreferredSize? test = PreferredSize(
    //child: Container(
      //color: Colors.blue,
      //width: 300,
      //height: 50,
    //),
    //preferredSize: Size(50,50),
  //);
  // le AppBar
  static AppBar appBar(Widget action, String title, Widget icon,Function pressAction,Function pressIcon)
  {
    return AppBar(
      backgroundColor: kColorAppBar,
      centerTitle: true,
      leadingWidth: 100,
      leading: IconButton(icon: action,onPressed: pressAction as void Function(),),
      title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
      actions: [
        Container(
          width: 100,
          child: IconButton(onPressed: pressIcon as void Function(), icon: icon,color: kColorPrimary,iconSize: 30,),
        ),
      ],
      //bottom: test,
    );
  }
}