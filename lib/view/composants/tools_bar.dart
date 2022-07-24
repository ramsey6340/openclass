import 'package:flutter/material.dart';

import '../constante.dart';

class ToolsBar
{
  // le AppBar
  static AppBar appBar(Widget? action, String? title, Widget? icon,Function? pressAction,Function? pressIcon)
  {
    return AppBar(
      backgroundColor: kColorAppBar,
      centerTitle: true,
      leadingWidth: 100,
      leading: IconButton(icon: action!,onPressed: pressAction as void Function(),),
      title: Text(title!,style: TextStyle(fontWeight: FontWeight.bold),),
      actions: [
        Container(
          width: 100,
          child: IconButton(onPressed: pressIcon as void Function(), icon: icon!,color: kColorPrimary,iconSize: 30,),
        ),
      ],
      //bottom: test,
    );
  }

  static Widget falseAppBar(Widget action, String title, Widget icon,Function pressAction,Function pressIcon)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //IconButton(icon: action,onPressed: pressAction as void Function(),),
        GestureDetector(
          child: action,
          onTap: pressAction as void Function(),
        ),
        Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        //IconButton(onPressed: pressIcon as void Function(), icon: icon,color: kColorPrimary,iconSize: 30,),
        GestureDetector(
          child: icon,
          onTap: pressIcon as void Function(),
        ),
      ],
    );
  }
}