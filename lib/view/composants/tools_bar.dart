import 'package:flutter/material.dart';
import '../constante.dart';

/// La classe qui permet de créer des appBar (la barre d'outils situé en haut de l'application)

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
      title: Text(title!,style: const TextStyle(fontWeight: FontWeight.bold),),
      actions: [
        SizedBox(
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
        Text(title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        //IconButton(onPressed: pressIcon as void Function(), icon: icon,color: kColorPrimary,iconSize: 30,),
        GestureDetector(
          child: icon,
          onTap: pressIcon as void Function(),
        ),
      ],
    );
  }
}