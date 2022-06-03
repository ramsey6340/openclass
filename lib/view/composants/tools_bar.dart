import 'package:flutter/material.dart';
import 'package:openclass/view/composants/search_bar.dart';

import '../constante.dart';

class ToolsBar
{
  // le AppBar
  static AppBar appBar(String action, String title, Icon icon,Function pressAction,Function pressIcon)
  {
    return AppBar(
      backgroundColor: kColorAppBar,
      centerTitle: true,
      leadingWidth: 100,
      leading: IconButton(icon: Text(action,style: TextStyle(fontSize: 20,color: kColorPrimary),),onPressed: pressAction as void Function(),),
      title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
      actions: [
        IconButton(onPressed: pressIcon as void Function(), icon: icon,color: kColorPrimary,iconSize: 30,),
      ],
    );
  }
}